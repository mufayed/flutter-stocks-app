import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:ticker/core/presentation/cubit/stock_subscription/stock_subscription_cubit.dart';
import 'package:ticker/core/presentation/cubit/stock_subscription/stock_subscription_state.dart';
import 'package:ticker/core/presentation/cubit/stock_symbol_cubit/stock_symbol_cubit.dart';
import 'package:ticker/core/presentation/screens/main_screen.dart';
import 'package:domain_layer/entities/stock_symbol.dart';
import 'package:ticker/core/presentation/screens/widgets/search_widget.dart';
import 'package:ticker/util/date_helper.dart';

import 'main_screen_test.mocks.dart';

// Generate mocks
@GenerateMocks([
  StockSymbolCubit,
  StockSubscriptionCubit,
  DateHelper,
])
void main() {
  const stockSymbols = [
    StockSymbol(
        description: 'Oanda France 40',
        displaySymbol: 'FR40/EUR',
        symbol: 'FR40/EUR'),
    StockSymbol(
        description: 'Oanda West Texas Oil',
        displaySymbol: 'WTICO/USD',
        symbol: 'WTICO/USD'),
    StockSymbol(
        description: 'Oanda US Wall St 30',
        displaySymbol: 'US30/USD',
        symbol: 'US30/USD')
  ];

  late MockStockSymbolCubit mockStockSymbolCubit;
  late MockStockSubscriptionCubit mockSubscriptionCubit;
  late GetIt sl;

  setUp(() {
    sl = GetIt.instance;

    // Check if DateHelper is already registered and only register if not
    if (!sl.isRegistered<DateHelper>()) {
      sl.registerLazySingleton<DateHelper>(() => MockDateHelper());
    }

    mockStockSymbolCubit = MockStockSymbolCubit();
    mockSubscriptionCubit = MockStockSubscriptionCubit();

    provideDummy<StockSymbolState>(StockSymbolInitial());
    provideDummy<StockSubscriptionState>(StockSubscriptionInitial());

    final mockDateHelper = sl<DateHelper>() as MockDateHelper;
    final String expectedDate = DateFormat('d MMMM').format(DateTime.now());
    when(mockDateHelper.getTodayDate()).thenReturn(expectedDate);
    when(mockStockSymbolCubit.stream).thenAnswer((_) => const Stream.empty());
    when(mockStockSymbolCubit.state).thenReturn(StockSymbolInitial());

    when(mockSubscriptionCubit.stream).thenAnswer((_) => const Stream.empty());
    when(mockSubscriptionCubit.state).thenReturn(StockSubscriptionInitial());
  });

  tearDown(() {
    // Reset GetIt to clean up after tests
    sl.reset();
  });

  Widget createMainScreen() {
    return MultiBlocProvider(providers: [
      BlocProvider<StockSymbolCubit>(
        create: (_) => mockStockSymbolCubit,
      ),
      BlocProvider<StockSubscriptionCubit>(
        create: (_) => mockSubscriptionCubit,
      ),
    ], child: const MaterialApp(home: MainScreen()));
  }

  group('MainScreen widget testing', () {
    testWidgets('Testing the progress indicator', (WidgetTester tester) async {
      when(mockStockSymbolCubit.state).thenReturn(StockSymbolLoading());

      await tester.pumpWidget(createMainScreen());

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('Testing the StockSymbolLoaded state',
            (WidgetTester tester) async {
          when(mockStockSymbolCubit.state)
              .thenReturn(const StockSymbolLoaded(stockSymbols));

          await tester.pumpWidget(createMainScreen());

          expect(find.text('FR40/EUR'), findsOneWidget);
          expect(find.text('Oanda France 40'), findsOneWidget);
          expect(find.text('WTICO/USD'), findsOneWidget);
          expect(find.text('Oanda West Texas Oil'), findsOneWidget);
          expect(find.text('Explore'), findsOneWidget);
        });

    testWidgets('Testing retry widget', (WidgetTester tester) async {
      when(mockStockSymbolCubit.state)
          .thenReturn(const StockSymbolError('Ops, Something went wrong'));

      await tester.pumpWidget(createMainScreen());

      expect(find.text('Ops, Something went wrong'), findsOneWidget);
      expect(find.byType(ElevatedButton), findsOneWidget);
    });
  });

  // SearchFieldWidget tests
  group('SearchFieldWidget tests', () {
    testWidgets('renders the search field correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SearchFieldWidget(symbolsList: stockSymbols),
          ),
        ),
      );

      expect(find.byType(TextField), findsOneWidget);

      expect(find.text('Explore'), findsOneWidget);
    });

    testWidgets('Show the suggestions when user types', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SearchFieldWidget(symbolsList: stockSymbols),
          ),
        ),
      );

      await tester.enterText(find.byType(TextField), 'FR40');
      // Rebuild the widget after the text is entered
      await tester.pump();

      expect(find.text('FR40/EUR'), findsOneWidget);
      expect(find.byType(ListView), findsOneWidget);
    });
  });
}
