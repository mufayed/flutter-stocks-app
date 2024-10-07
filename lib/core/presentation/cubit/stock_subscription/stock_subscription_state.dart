import 'package:equatable/equatable.dart';
import 'package:domain_layer/entities/symbol_realtime.dart';

enum StockChangeStatus { up, down, none }

abstract class StockSubscriptionState extends Equatable {
  const StockSubscriptionState();

  @override
  List<Object?> get props => [];
}

class StockSubscriptionInitial extends StockSubscriptionState {}

class StockSubscriptionLoading extends StockSubscriptionState {}

class StockSubscriptionLoaded extends StockSubscriptionState {
  final SymbolRealtime stock;
  final StockChangeStatus changeStatus;

  const StockSubscriptionLoaded({
    required this.stock,
    required this.changeStatus,
  });

  @override
  List<Object?> get props => [stock];
}

class StockSubscriptionError extends StockSubscriptionState {
  final String message;

  const StockSubscriptionError(this.message);

  @override
  List<Object?> get props => [message];
}
