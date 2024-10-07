import 'package:domain_layer/core/result.dart';

import '../../../models/symbol_realtime/symbol_realtime_model.dart';

abstract class SymbolsSocketDataSource {
  // subscribes to the stock symbol and returns the realtime data
  Stream<Result<SymbolRealTimeModel>> subscribeToSymbol(String symbol);

  // unsubscribes from the stock symbol
  unsubscribeFromSymbol(String symbol);

  // closes the websocket connection
  closeConnection();
}
