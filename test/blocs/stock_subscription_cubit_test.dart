import 'package:bloc_test/bloc_test.dart';
import 'package:domain_layer/core/network_error.dart';
import 'package:domain_layer/core/result.dart';
import 'package:domain_layer/entities/symbol_realtime.dart';
import 'package:domain_layer/usecases/subscribe_to_symbol_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:ticker/core/presentation/cubit/stock_subscription/stock_subscription_cubit.dart';
import 'package:ticker/core/presentation/cubit/stock_subscription/stock_subscription_state.dart';

import 'stock_subscription_cubit_test.mocks.dart';

@GenerateMocks([SubscribeToSymbolUseCase])
void main() {
  late StockSubscriptionCubit stockSubscriptionCubit;
  late MockSubscribeToSymbolUseCase mockSubscribeToSymbolUseCase;

  const symbol = 'XAU/CHF';

  // Mock data
  const SymbolRealtime symbolRealtime = SymbolRealtime(
    symbol: 'XAU/CHF',
    price: 2276.86,
    volume: 1000000,
    timestamp: 1728240740,
  );

  setUp(() {
    mockSubscribeToSymbolUseCase = MockSubscribeToSymbolUseCase();
    stockSubscriptionCubit =
        StockSubscriptionCubit(mockSubscribeToSymbolUseCase);
  });

  tearDown(() {
    stockSubscriptionCubit.close();
  });

  group('StockSubscriptionCubit', () {
    // Test success state
    blocTest<StockSubscriptionCubit, StockSubscriptionState>(
      'Success state',
      build: () {
        when(mockSubscribeToSymbolUseCase.call(any))
            .thenAnswer((_) => Stream.value(Result.success(symbolRealtime)));
        return stockSubscriptionCubit;
      },
      act: (cubit) => cubit.subscribeToSymbol(symbol: symbol),
      expect: () => [
        StockSubscriptionLoading(),
        const StockSubscriptionLoaded(
          stock: symbolRealtime,
          changeStatus: StockChangeStatus.none,
        ),
      ],
    );

    // Test error state
    blocTest<StockSubscriptionCubit, StockSubscriptionState>(
      'Error state',
      build: () {
        when(mockSubscribeToSymbolUseCase.call(any)).thenAnswer((_) =>
            Stream.value(
                Result.failure(const NetworkError.request(message: 'Error'))));
        return stockSubscriptionCubit;
      },
      act: (cubit) => cubit.subscribeToSymbol(symbol: symbol),
      expect: () => [
        StockSubscriptionLoading(),
        const StockSubscriptionError('Error'),
      ],
    );
  });
}
