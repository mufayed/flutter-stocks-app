import 'package:data_layer/models/symbol/symbol_model.dart';
import 'package:domain_layer/core/result.dart';

abstract class SymbolsRemoteDataSource {
  // fetches the list of stock symbols
  Future<Result<List<SymbolModel>>> fetchStockSymbols();
}
