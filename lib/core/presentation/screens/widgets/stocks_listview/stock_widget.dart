import 'package:domain_layer/entities/stock_symbol.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticker/core/presentation/cubit/stock_subscription/stock_subscription_cubit.dart';
import 'package:ticker/core/presentation/cubit/stock_subscription/stock_subscription_state.dart';

class StockWidget extends StatefulWidget {
  final StockSymbol symbol;
  final bool primaryStock;

  const StockWidget(
      {super.key, required this.symbol, required this.primaryStock});

  @override
  State<StockWidget> createState() => _StockWidgetState();
}

class _StockWidgetState extends State<StockWidget> {
  double _price = 0.0;
  StockChangeStatus _changeStatus = StockChangeStatus.none;
  late StockSubscriptionCubit _stockSubscriptionCubit;

  @override
  void initState() {
    _stockSubscriptionCubit = context.read<StockSubscriptionCubit>();
    _stockSubscriptionCubit.subscribeToSymbol(symbol: widget.symbol.symbol);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StockSubscriptionCubit, StockSubscriptionState>(
      listener: _stockSubscriptionListener,
      builder: (context, state) {
        return Container(
          margin: const EdgeInsets.only(bottom: 16),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.1),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.symbol.displaySymbol,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      widget.symbol.description,
                      style: TextStyle(
                          color: Colors.white.withOpacity(0.5),
                          fontSize: 13,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              if (state is StockSubscriptionLoading)
                const SmallProgressBar()
              else if (state is StockSubscriptionLoaded)
                _price != 0
                    ? Text(
                        _price.toStringAsFixed(2),
                        style: TextStyle(
                            color: _changeStatus == StockChangeStatus.up
                                ? Colors.green
                                : _changeStatus == StockChangeStatus.down
                                    ? Colors.red
                                    : Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      )
                    : const SmallProgressBar(),
            ],
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    // if the stock is not in the stocks that are showing in the main screen then unsubscribe from it
    if (!widget.primaryStock) {
      _stockSubscriptionCubit.unsubscribeFromSymbol(
          symbol: widget.symbol.symbol);
    }
    super.dispose();
  }

  _stockSubscriptionListener(
      BuildContext context, StockSubscriptionState state) {
    if (state is StockSubscriptionLoaded) {
      // if the stock is not the one that we are looking for then return
      // this to avoid updating the UI with the wrong stock data
      if (state.stock.symbol != widget.symbol.symbol) {
        return;
      }
      setState(() {
        _price = state.stock.price;
        _changeStatus = state.changeStatus;
      });
    }
  }
}

class SmallProgressBar extends StatelessWidget {
  const SmallProgressBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 18,
      height: 18,
      child: CircularProgressIndicator(
        strokeWidth: 2,
      ),
    );
  }
}
