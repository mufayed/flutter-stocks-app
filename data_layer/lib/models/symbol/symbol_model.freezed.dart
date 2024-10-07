// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'symbol_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SymbolModel _$SymbolModelFromJson(Map<String, dynamic> json) {
  return _SymbolModel.fromJson(json);
}

/// @nodoc
mixin _$SymbolModel {
  String get description => throw _privateConstructorUsedError;
  String get displaySymbol => throw _privateConstructorUsedError;
  String get symbol => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SymbolModelCopyWith<SymbolModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SymbolModelCopyWith<$Res> {
  factory $SymbolModelCopyWith(
          SymbolModel value, $Res Function(SymbolModel) then) =
      _$SymbolModelCopyWithImpl<$Res, SymbolModel>;
  @useResult
  $Res call({String description, String displaySymbol, String symbol});
}

/// @nodoc
class _$SymbolModelCopyWithImpl<$Res, $Val extends SymbolModel>
    implements $SymbolModelCopyWith<$Res> {
  _$SymbolModelCopyWithImpl(this._value, this._then);

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
abstract class _$$SymbolModelImplCopyWith<$Res>
    implements $SymbolModelCopyWith<$Res> {
  factory _$$SymbolModelImplCopyWith(
          _$SymbolModelImpl value, $Res Function(_$SymbolModelImpl) then) =
      __$$SymbolModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String description, String displaySymbol, String symbol});
}

/// @nodoc
class __$$SymbolModelImplCopyWithImpl<$Res>
    extends _$SymbolModelCopyWithImpl<$Res, _$SymbolModelImpl>
    implements _$$SymbolModelImplCopyWith<$Res> {
  __$$SymbolModelImplCopyWithImpl(
      _$SymbolModelImpl _value, $Res Function(_$SymbolModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? description = null,
    Object? displaySymbol = null,
    Object? symbol = null,
  }) {
    return _then(_$SymbolModelImpl(
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
@JsonSerializable()
class _$SymbolModelImpl implements _SymbolModel {
  const _$SymbolModelImpl(
      {required this.description,
      required this.displaySymbol,
      required this.symbol});

  factory _$SymbolModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SymbolModelImplFromJson(json);

  @override
  final String description;
  @override
  final String displaySymbol;
  @override
  final String symbol;

  @override
  String toString() {
    return 'SymbolModel(description: $description, displaySymbol: $displaySymbol, symbol: $symbol)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SymbolModelImpl &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.displaySymbol, displaySymbol) ||
                other.displaySymbol == displaySymbol) &&
            (identical(other.symbol, symbol) || other.symbol == symbol));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, description, displaySymbol, symbol);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SymbolModelImplCopyWith<_$SymbolModelImpl> get copyWith =>
      __$$SymbolModelImplCopyWithImpl<_$SymbolModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SymbolModelImplToJson(
      this,
    );
  }
}

abstract class _SymbolModel implements SymbolModel {
  const factory _SymbolModel(
      {required final String description,
      required final String displaySymbol,
      required final String symbol}) = _$SymbolModelImpl;

  factory _SymbolModel.fromJson(Map<String, dynamic> json) =
      _$SymbolModelImpl.fromJson;

  @override
  String get description;
  @override
  String get displaySymbol;
  @override
  String get symbol;
  @override
  @JsonKey(ignore: true)
  _$$SymbolModelImplCopyWith<_$SymbolModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
