part of 'stock_symbol_cubit.dart';

sealed class StockSymbolState extends Equatable {
  const StockSymbolState();

  @override
  List<Object> get props => [];
}

final class StockSymbolInitial extends StockSymbolState {}

final class StockSymbolLoading extends StockSymbolState {}

final class StockSymbolLoaded extends StockSymbolState {
  final List<StockSymbol> symbols;

  const StockSymbolLoaded(this.symbols);

  @override
  List<Object> get props => [symbols];
}

final class StockSymbolError extends StockSymbolState {
  final String message;

  const StockSymbolError(this.message);

  @override
  List<Object> get props => [message];
}
