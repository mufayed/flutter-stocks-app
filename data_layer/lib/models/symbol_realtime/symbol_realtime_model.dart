import 'package:freezed_annotation/freezed_annotation.dart';

part 'symbol_realtime_model.freezed.dart';
part 'symbol_realtime_model.g.dart';

@freezed
class SymbolRealTimeModel with _$SymbolRealTimeModel {
  const factory SymbolRealTimeModel({
    String? c,                // Optional nullable field (conditions or other info)
    required double p,         // Price
    required String s,         // Symbol
    required int t,            // Timestamp
    required double v,         // Volume
  }) = _SymbolRealTimeModel;

  factory SymbolRealTimeModel.fromJson(Map<String, dynamic> json) =>
      _$SymbolRealTimeModelFromJson(json);
}
