import 'package:data_layer/models/symbol/symbol_model.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:domain_layer/core/result.dart';
import 'package:domain_layer/core/network_error.dart';
import 'package:domain_layer/entities/stock_symbol.dart';
import 'package:data_layer/repositories/symbols_repository_impl.dart';
import 'package:data_layer/data_sources/remote/symbols/symbols_remote_data_source.dart';
import 'package:data_layer/data_sources/remote/symbols_socket/symbols_socket_data_source.dart';
import 'package:test/test.dart';
import 'data_layer_test.mocks.dart';

@GenerateMocks([SymbolsRemoteDataSource, SymbolsSocketDataSource])
void main() {
  late SymbolsRepositoryImpl repository;
  late MockSymbolsRemoteDataSource mockRemoteDataSource;
  late MockSymbolsSocketDataSource mockSocketDataSource;

  setUp(() {
    mockRemoteDataSource = MockSymbolsRemoteDataSource();
    mockSocketDataSource = MockSymbolsSocketDataSource();
    repository = SymbolsRepositoryImpl(
      dataSource: mockRemoteDataSource,
      socketDataSource: mockSocketDataSource,
    );
  });

  group('getStockSymbols', () {
    const symbolModel = SymbolModel(
      description: 'test',
      displaySymbol: 'test',
      symbol: 'test',
    );
    final List<SymbolModel> symbolModelList = [symbolModel];
    final List<StockSymbol> stockSymbolList = [
      const StockSymbol(
        description: 'test',
        displaySymbol: 'test',
        symbol: 'test',
      ),
    ];

    test('Success', () async {
      when(mockRemoteDataSource.fetchStockSymbols())
          .thenAnswer((_) async => Result.success(symbolModelList));

      final result = await repository.getStockSymbols();

      expect(result.isSuccess, true);
      expect(result.data, stockSymbolList);
    });

    test('Fail', () async {
      const error = NetworkError.request(message: 'Error');
      when(mockRemoteDataSource.fetchStockSymbols())
          .thenAnswer((_) async => Result.failure(error));

      final result = await repository.getStockSymbols();

      expect(result.isSuccess, false);
      expect(result.error, error);
    });
  });

  // group('subscribeToSymbol', () {
  //   // Mock the model, which the data layer uses
  //   const symbolRealTimeModel = SymbolRealTimeModel(
  //     symbol: 'AAPL',
  //     price: 150.00,
  //   );
  //
  //   // The corresponding entity that will be passed to the domain layer
  //   const symbolRealtime = SymbolRealtime(
  //     symbol: 'AAPL',
  //     price: 150.00,
  //   );
  //
  //   test('Success', () async {
  //     // Mock the WebSocket data source to return the model
  //     when(mockSocketDataSource.subscribeToSymbol('AAPL'))
  //         .thenAnswer((_) => Stream.fromIterable([
  //       Result.success(symbolRealTimeModel),
  //     ]));
  //
  //     // Repository converts the model to an entity and emits the entity
  //     final resultStream = repository.subscribeToSymbol('AAPL');
  //
  //     await expectLater(
  //       resultStream,
  //       emitsInOrder([
  //         Result.success(symbolRealtime),  // Check the emission
  //         emitsDone,  // Explicitly check that the stream closes
  //       ]),
  //     );
  //   });
  //
  //   test('Failure', () async {
  //     const error = NetworkError.request(message: 'WebSocket Error');
  //     when(mockSocketDataSource.subscribeToSymbol('AAPL'))
  //         .thenAnswer((_) => Stream.fromIterable([
  //       Result.failure(error),
  //     ]));
  //
  //     final resultStream = repository.subscribeToSymbol('AAPL');
  //
  //     await expectLater(
  //       resultStream,
  //       emitsInOrder([
  //         Result.failure(error),  // Check the failure emission
  //         emitsDone,  // Explicitly check that the stream closes
  //       ]),
  //     );
  //   });
  // });
}
