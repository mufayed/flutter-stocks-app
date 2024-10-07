import 'package:domain_layer/repositories/symbols_repository.dart';
import '../core/result.dart';
import '../entities/stock_symbol.dart';

class GetStockSymbolsUseCase {
  final SymbolsRepository repository;

  GetStockSymbolsUseCase({
    required this.repository,
  });

  Future<Result<List<StockSymbol>>> call() {
    return repository.getStockSymbols();
  }
}
