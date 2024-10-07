import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticker/core/presentation/screens/main_screen.dart';

import '../../config/dependencies.dart';
import 'cubit/stock_subscription/stock_subscription_cubit.dart';
import 'cubit/stock_symbol_cubit/stock_symbol_cubit.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<StockSymbolCubit>(
          create: (context) => StockSymbolCubit(
            locator(),
          )..fetchStockSymbols(),
        ),
        BlocProvider<StockSubscriptionCubit>(
          create: (context) => StockSubscriptionCubit(
            locator(),
          ),
        )
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            useMaterial3: true,
          ),
          home: const MainScreen()),
    );
  }
}
