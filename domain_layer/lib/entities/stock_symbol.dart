

import 'package:freezed_annotation/freezed_annotation.dart';

part 'stock_symbol.freezed.dart';

@freezed
class StockSymbol with _$StockSymbol {
  const factory StockSymbol({
    required String description,
    required String displaySymbol,
    required String symbol,
  }) = _StockSymbol;

}