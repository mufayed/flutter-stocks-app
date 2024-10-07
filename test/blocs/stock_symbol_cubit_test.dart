import 'package:bloc_test/bloc_test.dart';
import 'package:domain_layer/core/network_error.dart';
import 'package:domain_layer/core/result.dart';
import 'package:domain_layer/entities/stock_symbol.dart';
import 'package:domain_layer/usecases/get_stock_symbols_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:ticker/core/presentation/cubit/stock_symbol_cubit/stock_symbol_cubit.dart';
import 'stock_symbol_cubit_test.mocks.dart';

// Generate mock class
@GenerateMocks([GetStockSymbolsUseCase])
void main() {
  late StockSymbolCubit stockSymbolCubit;
  late MockGetStockSymbolsUseCase mockGetStockSymbolsUseCase;

  // Test data
  const stock1 = StockSymbol(
      description: 'XAU/CHF',
      displaySymbol: 'XAU/CHF',
      symbol: 'OANDA:XAU/CHF');
  const stock2 = StockSymbol(
      description: 'EUR/CAD',
      displaySymbol: 'EUR/CAD',
      symbol: 'OANDA:EUR/CAD');
  final List<StockSymbol> mockSymbolsData = [stock1, stock2];

  setUp(() {
    mockGetStockSymbolsUseCase = MockGetStockSymbolsUseCase();
    stockSymbolCubit = StockSymbolCubit(mockGetStockSymbolsUseCase);
  });

  tearDown(() {
    stockSymbolCubit.close();
  });

  group('StockSymbolCubit', () {
    // Initial state test
    test('StockSymbolInitial state', () {
      expect(stockSymbolCubit.state, StockSymbolInitial());
    });

    // Test successful state
    blocTest<StockSymbolCubit, StockSymbolState>(
      'Success state',
      build: () {
        when(mockGetStockSymbolsUseCase.call())
            .thenAnswer((_) async => Result.success(mockSymbolsData));
        return stockSymbolCubit;
      },
      act: (cubit) => cubit.fetchStockSymbols(),
      expect: () => [
        StockSymbolLoading(),
        StockSymbolLoaded(mockSymbolsData),
      ],
    );

    // test empty state without data
    blocTest<StockSymbolCubit, StockSymbolState>(
      'Empty state, no stocks found',
      build: () {
        when(mockGetStockSymbolsUseCase.call())
            .thenAnswer((_) async => Result.success([]));
        return stockSymbolCubit;
      },
      act: (cubit) => cubit.fetchStockSymbols(),
      expect: () => [
        StockSymbolLoading(),
        const StockSymbolError('No Stocks found'),
      ],
    );

    // Test failed state
    blocTest<StockSymbolCubit, StockSymbolState>(
      'Failed state',
      build: () {
        when(mockGetStockSymbolsUseCase.call()).thenAnswer((_) async =>
            Result.failure(const NetworkError.request(message: 'Failed')));
        return stockSymbolCubit;
      },
      act: (cubit) => cubit.fetchStockSymbols(),
      expect: () => [
        StockSymbolLoading(),
        const StockSymbolError('Failed'), // Updated error message
      ],
    );
  });
}
