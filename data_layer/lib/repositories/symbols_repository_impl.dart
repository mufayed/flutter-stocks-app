import 'package:data_layer/data_sources/remote/symbols/symbols_remote_data_source.dart';
import 'package:domain_layer/core/result.dart';
import 'package:domain_layer/entities/stock_symbol.dart';
import 'package:domain_layer/entities/symbol_realtime.dart';
import 'package:domain_layer/repositories/symbols_repository.dart';

import '../data_sources/remote/symbols_socket/symbols_socket_data_source.dart';

class SymbolsRepositoryImpl implements SymbolsRepository {
  final SymbolsRemoteDataSource dataSource;
  final SymbolsSocketDataSource socketDataSource;

  SymbolsRepositoryImpl({
    required this.dataSource,
    required this.socketDataSource,
  });

  @override
  Future<Result<List<StockSymbol>>> getStockSymbols() async {
    // Fetch the stock symbols from the remote data source
    final remoteResult = await dataSource.fetchStockSymbols();

    // Map the result to the domain layer entities
    if (remoteResult.isSuccess && remoteResult.data != null) {
      final symbols = remoteResult.data!.map((symbolModel) {
        return StockSymbol(
          description: symbolModel.description,
          displaySymbol: symbolModel.displaySymbol,
          symbol: symbolModel.symbol,
        );
      }).toList();

      return Result.success(symbols);
    } else {
      return Result.failure(remoteResult.error);
    }
  }

  @override
  Stream<Result<SymbolRealtime>> subscribeToSymbol(String symbol) {
    // Use the broadcast stream from the socket data source
    final socketStream = socketDataSource.subscribeToSymbol(symbol);

    return socketStream.map((result) {
      if (result.isSuccess && result.data != null) {
        final symbolRealtime = SymbolRealtime(
          symbol: result.data!.s,
          price: result.data!.p,
          timestamp: result.data!.t,
          volume: result.data!.v,
        );
        return Result.success(symbolRealtime);
      } else {
        return Result.failure(result.error);
      }
    });
  }

  @override
  void closeWebSocketConnection() {
    socketDataSource.closeConnection();
  }

  @override
  void unsubscribeFromSymbol(String symbol) {
    socketDataSource.unsubscribeFromSymbol(symbol);
  }
}
