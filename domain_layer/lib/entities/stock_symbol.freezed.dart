// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stock_symbol.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$StockSymbol {
  String get description => throw _privateConstructorUsedError;
  String get displaySymbol => throw _privateConstructorUsedError;
  String get symbol => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $StockSymbolCopyWith<StockSymbol> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StockSymbolCopyWith<$Res> {
  factory $StockSymbolCopyWith(
          StockSymbol value, $Res Function(StockSymbol) then) =
      _$StockSymbolCopyWithImpl<$Res, StockSymbol>;
  @useResult
  $Res call({String description, String displaySymbol, String symbol});
}

/// @nodoc
class _$StockSymbolCopyWithImpl<$Res, $Val extends StockSymbol>
    implements $StockSymbolCopyWith<$Res> {
  _$StockSymbolCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? description = null,
    Object? displaySymbol = null,
    Object? symbol = null,
  }) {
    return _then(_value.copyWith(
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      displaySymbol: null == displaySymbol
          ? _value.displaySymbol
          : displaySymbol // ignore: cast_nullable_to_non_nullable
              as String,
      symbol: null == symbol
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StockSymbolImplCopyWith<$Res>
    implements $StockSymbolCopyWith<$Res> {
  factory _$$StockSymbolImplCopyWith(
          _$StockSymbolImpl value, $Res Function(_$StockSymbolImpl) then) =
      __$$StockSymbolImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String description, String displaySymbol, String symbol});
}

/// @nodoc
class __$$StockSymbolImplCopyWithImpl<$Res>
    extends _$StockSymbolCopyWithImpl<$Res, _$StockSymbolImpl>
    implements _$$StockSymbolImplCopyWith<$Res> {
  __$$StockSymbolImplCopyWithImpl(
      _$StockSymbolImpl _value, $Res Function(_$StockSymbolImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? description = null,
    Object? displaySymbol = null,
    Object? symbol = null,
  }) {
    return _then(_$StockSymbolImpl(
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      displaySymbol: null == displaySymbol
          ? _value.displaySymbol
          : displaySymbol // ignore: cast_nullable_to_non_nullable
              as String,
      symbol: null == symbol
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$StockSymbolImpl implements _StockSymbol {
  const _$StockSymbolImpl(
      {required this.description,
      required this.displaySymbol,
      required this.symbol});

  @override
  final String description;
  @override
  final String displaySymbol;
  @override
  final String symbol;

  @override
  String toString() {
    return 'StockSymbol(description: $description, displaySymbol: $displaySymbol, symbol: $symbol)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StockSymbolImpl &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.displaySymbol, displaySymbol) ||
                other.displaySymbol == displaySymbol) &&
            (identical(other.symbol, symbol) || other.symbol == symbol));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, description, displaySymbol, symbol);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StockSymbolImplCopyWith<_$StockSymbolImpl> get copyWith =>
      __$$StockSymbolImplCopyWithImpl<_$StockSymbolImpl>(this, _$identity);
}

abstract class _StockSymbol implements StockSymbol {
  const factory _StockSymbol(
      {required final String description,
      required final String displaySymbol,
      required final String symbol}) = _$StockSymbolImpl;

  @override
  String get description;
  @override
  String get displaySymbol;
  @override
  String get symbol;
  @override
  @JsonKey(ignore: true)
  _$$StockSymbolImplCopyWith<_$StockSymbolImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
