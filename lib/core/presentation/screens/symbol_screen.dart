import 'package:domain_layer/entities/stock_symbol.dart';
import 'package:flutter/material.dart';
import 'package:ticker/config/dependencies.dart';
import 'package:ticker/core/presentation/screens/widgets/header_widget.dart';
import 'package:ticker/core/presentation/screens/widgets/stocks_listview/stock_widget.dart';
import 'package:ticker/util/date_helper.dart';

class SymbolScreen extends StatelessWidget {
  final StockSymbol symbol;
  final bool primaryStock;

  const SymbolScreen({super.key, required this.symbol, required this.primaryStock});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //back button icon
              IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              HeaderWidget(
                title: 'Stock',
                subtitle: locator<DateHelper>().getTodayDate(),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: StockWidget(symbol: symbol, primaryStock: primaryStock,),
              )
            ],
          ),
        ),
      ),
    );
  }
}
