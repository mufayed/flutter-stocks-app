import 'package:domain_layer/core/result.dart';
import 'package:domain_layer/entities/stock_symbol.dart';
import 'package:domain_layer/usecases/get_stock_symbols_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'stock_symbol_state.dart';

class StockSymbolCubit extends Cubit<StockSymbolState> {
  final GetStockSymbolsUseCase _getStockSymbols;

  StockSymbolCubit(this._getStockSymbols) : super(StockSymbolInitial());

  List<StockSymbol> _result = [];

  Future<void> fetchStockSymbols() async {
    emit(StockSymbolLoading());

    // If the _result is not empty, we don't need to fetch the data again
    if (_result.isNotEmpty) {
      emit(StockSymbolLoaded(_result));
      return;
    }
    try {
      final Result<List<StockSymbol>> result = await _getStockSymbols.call();

      if (result.isSuccess) {
        final data = result.data;
        if (data != null && data.isNotEmpty) {
          // Save the result to avoid fetching the data again
          _result = data;
          emit(StockSymbolLoaded(data));
        } else {
          emit(const StockSymbolError('No Stocks found'));
        }
      } else {
        final error = result.error;
        if (error != null) {
          emit(StockSymbolError(error.message));
        } else {
          emit(const StockSymbolError('Unknown error'));
        }
      }
    } catch (e) {
      emit(const StockSymbolError('An unexpected error'));
    }
  }
}
