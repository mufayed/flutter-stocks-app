// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'symbol_realtime_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SymbolRealTimeModelImpl _$$SymbolRealTimeModelImplFromJson(
        Map<String, dynamic> json) =>
    _$SymbolRealTimeModelImpl(
      c: json['c'] as String?,
      p: (json['p'] as num).toDouble(),
      s: json['s'] as String,
      t: (json['t'] as num).toInt(),
      v: (json['v'] as num).toDouble(),
    );

Map<String, dynamic> _$$SymbolRealTimeModelImplToJson(
        _$SymbolRealTimeModelImpl instance) =>
    <String, dynamic>{
      'c': instance.c,
      'p': instance.p,
      's': instance.s,
      't': instance.t,
      'v': instance.v,
    };
