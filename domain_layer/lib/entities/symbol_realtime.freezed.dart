// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'symbol_realtime.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SymbolRealtime {
  double get price => throw _privateConstructorUsedError;
  String get symbol => throw _privateConstructorUsedError;
  int get timestamp => throw _privateConstructorUsedError;
  double get volume => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SymbolRealtimeCopyWith<SymbolRealtime> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SymbolRealtimeCopyWith<$Res> {
  factory $SymbolRealtimeCopyWith(
          SymbolRealtime value, $Res Function(SymbolRealtime) then) =
      _$SymbolRealtimeCopyWithImpl<$Res, SymbolRealtime>;
  @useResult
  $Res call({double price, String symbol, int timestamp, double volume});
}

/// @nodoc
class _$SymbolRealtimeCopyWithImpl<$Res, $Val extends SymbolRealtime>
    implements $SymbolRealtimeCopyWith<$Res> {
  _$SymbolRealtimeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? price = null,
    Object? symbol = null,
    Object? timestamp = null,
    Object? volume = null,
  }) {
    return _then(_value.copyWith(
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      symbol: null == symbol
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as int,
      volume: null == volume
          ? _value.volume
          : volume // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SymbolRealtimeImplCopyWith<$Res>
    implements $SymbolRealtimeCopyWith<$Res> {
  factory _$$SymbolRealtimeImplCopyWith(_$SymbolRealtimeImpl value,
          $Res Function(_$SymbolRealtimeImpl) then) =
      __$$SymbolRealtimeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double price, String symbol, int timestamp, double volume});
}

/// @nodoc
class __$$SymbolRealtimeImplCopyWithImpl<$Res>
    extends _$SymbolRealtimeCopyWithImpl<$Res, _$SymbolRealtimeImpl>
    implements _$$SymbolRealtimeImplCopyWith<$Res> {
  __$$SymbolRealtimeImplCopyWithImpl(
      _$SymbolRealtimeImpl _value, $Res Function(_$SymbolRealtimeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? price = null,
    Object? symbol = null,
    Object? timestamp = null,
    Object? volume = null,
  }) {
    return _then(_$SymbolRealtimeImpl(
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      symbol: null == symbol
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as int,
      volume: null == volume
          ? _value.volume
          : volume // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$SymbolRealtimeImpl implements _SymbolRealtime {
  const _$SymbolRealtimeImpl(
      {required this.price,
      required this.symbol,
      required this.timestamp,
      required this.volume});

  @override
  final double price;
  @override
  final String symbol;
  @override
  final int timestamp;
  @override
  final double volume;

  @override
  String toString() {
    return 'SymbolRealtime(price: $price, symbol: $symbol, timestamp: $timestamp, volume: $volume)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SymbolRealtimeImpl &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.symbol, symbol) || other.symbol == symbol) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.volume, volume) || other.volume == volume));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, price, symbol, timestamp, volume);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SymbolRealtimeImplCopyWith<_$SymbolRealtimeImpl> get copyWith =>
      __$$SymbolRealtimeImplCopyWithImpl<_$SymbolRealtimeImpl>(
          this, _$identity);
}

abstract class _SymbolRealtime implements SymbolRealtime {
  const factory _SymbolRealtime(
      {required final double price,
      required final String symbol,
      required final int timestamp,
      required final double volume}) = _$SymbolRealtimeImpl;

  @override
  double get price;
  @override
  String get symbol;
  @override
  int get timestamp;
  @override
  double get volume;
  @override
  @JsonKey(ignore: true)
  _$$SymbolRealtimeImplCopyWith<_$SymbolRealtimeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
