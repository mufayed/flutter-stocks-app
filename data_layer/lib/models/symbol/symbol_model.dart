import 'package:freezed_annotation/freezed_annotation.dart';

part 'symbol_model.freezed.dart';

part 'symbol_model.g.dart';

@freezed
class SymbolModel with _$SymbolModel {
  const factory SymbolModel({
    required String description,
    required String displaySymbol,
    required String symbol,
  }) = _SymbolModel;

  factory SymbolModel.fromJson(Map<String, dynamic> json) =>
      _$SymbolModelFromJson(json);
}
