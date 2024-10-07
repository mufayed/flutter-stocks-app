import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticker/config/dependencies.dart';
import 'package:ticker/core/presentation/cubit/stock_subscription/stock_subscription_cubit.dart';
import 'package:ticker/core/presentation/cubit/stock_symbol_cubit/stock_symbol_cubit.dart';
import 'package:ticker/core/presentation/screens/widgets/retry_widget.dart';
import 'package:ticker/util/date_helper.dart';
import 'widgets/header_widget.dart';
import 'widgets/search_widget.dart';
import 'widgets/stocks_listview/stocks_list_widget.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late StockSubscriptionCubit _stockSubscriptionCubit;

  @override
  void initState() {
    _stockSubscriptionCubit = context.read<StockSubscriptionCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StockSymbolCubit, StockSymbolState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.black,
          body: SafeArea(
            bottom: false,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeaderWidget(
                  title: 'Stocks',
                  subtitle: locator<DateHelper>().getTodayDate(),
                ),
                const SizedBox(height: 16),
                if (state is StockSymbolLoading)
                  const Expanded(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                if (state is StockSymbolLoaded)
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          // Search widget for searching stocks
                          SearchFieldWidget(
                            symbolsList: state.symbols,
                          ),
                          const SizedBox(height: 16),
                          // List of stocks it shows the first 10 stocks
                          StocksListWidget(
                            stocks: state.symbols.length > 10
                                ? state.symbols.sublist(0, 10)
                                : state.symbols,
                          ),
                        ],
                      ),
                    ),
                  ),

                // Retry widget to retry fetching stocks if any unexpected error occurs
                if (state is StockSymbolError)
                  Expanded(
                    child: Center(
                      child: RetryWidget(
                        title: 'Ops, Something went wrong',
                        description:
                            'Please check your internet connection and retry, or check again later',
                        retry: () {
                          _retry(context);
                        },
                      ),
                    ),
                  )
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    // Close the socket connection when the screen is disposed
    _stockSubscriptionCubit.closeSubscription();
    super.dispose();
  }

  _retry(BuildContext context) {
    context.read<StockSymbolCubit>().fetchStockSymbols();
  }
}
