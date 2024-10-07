import 'package:freezed_annotation/freezed_annotation.dart';

part 'symbol_realtime.freezed.dart';

@freezed
class SymbolRealtime with _$SymbolRealtime {
  const factory SymbolRealtime({
    required double price,
    required String symbol,
    required int timestamp,
    required  double volume,
  }) = _SymbolRealtime;
}
