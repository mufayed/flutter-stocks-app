import 'package:domain_layer/entities/symbol_realtime.dart';
import 'package:domain_layer/usecases/subscribe_to_symbol_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticker/core/presentation/cubit/stock_subscription/stock_subscription_state.dart';

class StockSubscriptionCubit extends Cubit<StockSubscriptionState> {
  final SubscribeToSymbolUseCase subscribeToSymbolUseCase;

  StockSubscriptionCubit(this.subscribeToSymbolUseCase)
      : super(StockSubscriptionInitial());

  /* Map to store the realtime data of the subscribed symbols,
   We have created this map to keep track of the previous price of the stocks */
  final Map<String, SymbolRealtime> _mapRealtime = {};

  void subscribeToSymbol({required String symbol}) {
    emit(StockSubscriptionLoading());

    subscribeToSymbolUseCase(symbol).listen((result) {
      if (result.isSuccess) {
        // Check the change status of the stock price
        StockChangeStatus changeStatus = _checkChangeStatus(
            updated: result.data!, previous: _mapRealtime[symbol]);
        emit(StockSubscriptionLoaded(
            stock: result.data!, changeStatus: changeStatus));
        _mapRealtime[symbol] = result.data!;
      } else {
        emit(StockSubscriptionError(result.error?.message ?? 'Error'));
      }
    });
  }

  StockChangeStatus _checkChangeStatus(
      {required SymbolRealtime updated, SymbolRealtime? previous}) {
    // If the previous price is not null, we can compare the prices
    if (previous?.price != null) {
      if (updated.price > previous!.price) {
        return StockChangeStatus.up;
      } else if (updated.price < previous.price) {
        return StockChangeStatus.down;
      } else {
        return StockChangeStatus.none;
      }
    } else {
      return StockChangeStatus.none;
    }
  }

  void unsubscribeFromSymbol({required String symbol}) {
    subscribeToSymbolUseCase.unsubscribeFromSymbol(symbol);
    _mapRealtime.remove(symbol);
  }

  void closeSubscription() {
    subscribeToSymbolUseCase.closeConnection();
    emit(StockSubscriptionInitial());
  }
}
