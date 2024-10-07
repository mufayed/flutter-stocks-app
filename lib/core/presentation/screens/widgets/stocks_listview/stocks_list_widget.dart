import 'package:domain_layer/entities/stock_symbol.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ticker/core/presentation/screens/widgets/stocks_listview/stock_widget.dart';

class StocksListWidget extends StatelessWidget {
  final List<StockSymbol> stocks;

  const StocksListWidget({super.key, required this.stocks});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.only(bottom: 32, left: 16, right: 16),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: stocks.length,
      itemBuilder: (context, index) {
        return StockWidget(
          symbol: stocks[index],
          primaryStock: true,
        );
      },
    );
  }
}
