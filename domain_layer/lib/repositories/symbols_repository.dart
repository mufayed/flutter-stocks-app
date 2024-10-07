import 'package:domain_layer/core/result.dart';
import 'package:domain_layer/entities/stock_symbol.dart';

import '../entities/symbol_realtime.dart';

abstract class SymbolsRepository {
  // fetches the list of stock symbols
  Future<Result<List<StockSymbol>>> getStockSymbols();

  // subscribes to the stock symbol and returns the realtime data
  Stream<Result<SymbolRealtime>> subscribeToSymbol(String symbol);

  // unsubscribes from the stock symbol
  unsubscribeFromSymbol(String symbol);

  // closes the websocket connection
  closeWebSocketConnection();
}
