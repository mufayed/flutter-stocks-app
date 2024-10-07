import 'package:domain_layer/core/result.dart';
import 'package:domain_layer/entities/symbol_realtime.dart';
import 'package:domain_layer/repositories/symbols_repository.dart';

class SubscribeToSymbolUseCase {
  final SymbolsRepository repository;

  SubscribeToSymbolUseCase(this.repository);

  Stream<Result<SymbolRealtime>> call(String symbol) {
    return repository.subscribeToSymbol(symbol);
  }

  unsubscribeFromSymbol(String symbol) {
    repository.unsubscribeFromSymbol(symbol);
  }

  closeConnection() {
    repository.closeWebSocketConnection();
  }
}
