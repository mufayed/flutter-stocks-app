// domain_layer/test/usecases/get_stock_symbols_test.dart

import 'package:domain_layer/core/network_error.dart';
import 'package:domain_layer/core/result.dart';
import 'package:domain_layer/entities/stock_symbol.dart';
import 'package:domain_layer/repositories/symbols_repository.dart';
import 'package:domain_layer/usecases/get_stock_symbols_use_case.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

// Import the generated mock file
import 'domain_layer_test.mocks.dart';

@GenerateMocks([SymbolsRepository])
void main() {
  late GetStockSymbolsUseCase usecase;
  late MockSymbolsRepository mockSymbolsRepository;

  group('getStockSymbolsUseCase', () {
  setUp(() {
    mockSymbolsRepository = MockSymbolsRepository();
    usecase = GetStockSymbolsUseCase(repository: mockSymbolsRepository);
  });

  const stockSymbols = [
    StockSymbol(description: 'test', displaySymbol: 'test', symbol: 'test'),
  ];

  test('Success', () async {
    when(mockSymbolsRepository.getStockSymbols())
        .thenAnswer((_) async => Result.success(stockSymbols));

    final result = await usecase.call();

    expect(result.isSuccess, true);
    expect(result.data, stockSymbols);
  });

  test('Fail', () async {
    const error = NetworkError.request(message: 'Error');
    when(mockSymbolsRepository.getStockSymbols())
        .thenAnswer((_) async => Result.failure(error));

    final result = await usecase.call();

    expect(result.isSuccess, false);
    expect(result.error, error);
  });
  });
}
