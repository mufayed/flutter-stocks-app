// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'symbol_realtime_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SymbolRealTimeModel _$SymbolRealTimeModelFromJson(Map<String, dynamic> json) {
  return _SymbolRealTimeModel.fromJson(json);
}

/// @nodoc
mixin _$SymbolRealTimeModel {
  String? get c =>
      throw _privateConstructorUsedError; // Optional nullable field (conditions or other info)
  double get p => throw _privateConstructorUsedError; // Price
  String get s => throw _privateConstructorUsedError; // Symbol
  int get t => throw _privateConstructorUsedError; // Timestamp
  double get v => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SymbolRealTimeModelCopyWith<SymbolRealTimeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SymbolRealTimeModelCopyWith<$Res> {
  factory $SymbolRealTimeModelCopyWith(
          SymbolRealTimeModel value, $Res Function(SymbolRealTimeModel) then) =
      _$SymbolRealTimeModelCopyWithImpl<$Res, SymbolRealTimeModel>;
  @useResult
  $Res call({String? c, double p, String s, int t, double v});
}

/// @nodoc
class _$SymbolRealTimeModelCopyWithImpl<$Res, $Val extends SymbolRealTimeModel>
    implements $SymbolRealTimeModelCopyWith<$Res> {
  _$SymbolRealTimeModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? c = freezed,
    Object? p = null,
    Object? s = null,
    Object? t = null,
    Object? v = null,
  }) {
    return _then(_value.copyWith(
      c: freezed == c
          ? _value.c
          : c // ignore: cast_nullable_to_non_nullable
              as String?,
      p: null == p
          ? _value.p
          : p // ignore: cast_nullable_to_non_nullable
              as double,
      s: null == s
          ? _value.s
          : s // ignore: cast_nullable_to_non_nullable
              as String,
      t: null == t
          ? _value.t
          : t // ignore: cast_nullable_to_non_nullable
              as int,
      v: null == v
          ? _value.v
          : v // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SymbolRealTimeModelImplCopyWith<$Res>
    implements $SymbolRealTimeModelCopyWith<$Res> {
  factory _$$SymbolRealTimeModelImplCopyWith(_$SymbolRealTimeModelImpl value,
          $Res Function(_$SymbolRealTimeModelImpl) then) =
      __$$SymbolRealTimeModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? c, double p, String s, int t, double v});
}

/// @nodoc
class __$$SymbolRealTimeModelImplCopyWithImpl<$Res>
    extends _$SymbolRealTimeModelCopyWithImpl<$Res, _$SymbolRealTimeModelImpl>
    implements _$$SymbolRealTimeModelImplCopyWith<$Res> {
  __$$SymbolRealTimeModelImplCopyWithImpl(_$SymbolRealTimeModelImpl _value,
      $Res Function(_$SymbolRealTimeModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? c = freezed,
    Object? p = null,
    Object? s = null,
    Object? t = null,
    Object? v = null,
  }) {
    return _then(_$SymbolRealTimeModelImpl(
      c: freezed == c
          ? _value.c
          : c // ignore: cast_nullable_to_non_nullable
              as String?,
      p: null == p
          ? _value.p
          : p // ignore: cast_nullable_to_non_nullable
              as double,
      s: null == s
          ? _value.s
          : s // ignore: cast_nullable_to_non_nullable
              as String,
      t: null == t
          ? _value.t
          : t // ignore: cast_nullable_to_non_nullable
              as int,
      v: null == v
          ? _value.v
          : v // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SymbolRealTimeModelImpl implements _SymbolRealTimeModel {
  const _$SymbolRealTimeModelImpl(
      {this.c,
      required this.p,
      required this.s,
      required this.t,
      required this.v});

  factory _$SymbolRealTimeModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SymbolRealTimeModelImplFromJson(json);

  @override
  final String? c;
// Optional nullable field (conditions or other info)
  @override
  final double p;
// Price
  @override
  final String s;
// Symbol
  @override
  final int t;
// Timestamp
  @override
  final double v;

  @override
  String toString() {
    return 'SymbolRealTimeModel(c: $c, p: $p, s: $s, t: $t, v: $v)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SymbolRealTimeModelImpl &&
            (identical(other.c, c) || other.c == c) &&
            (identical(other.p, p) || other.p == p) &&
            (identical(other.s, s) || other.s == s) &&
            (identical(other.t, t) || other.t == t) &&
            (identical(other.v, v) || other.v == v));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, c, p, s, t, v);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SymbolRealTimeModelImplCopyWith<_$SymbolRealTimeModelImpl> get copyWith =>
      __$$SymbolRealTimeModelImplCopyWithImpl<_$SymbolRealTimeModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SymbolRealTimeModelImplToJson(
      this,
    );
  }
}

abstract class _SymbolRealTimeModel implements SymbolRealTimeModel {
  const factory _SymbolRealTimeModel(
      {final String? c,
      required final double p,
      required final String s,
      required final int t,
      required final double v}) = _$SymbolRealTimeModelImpl;

  factory _SymbolRealTimeModel.fromJson(Map<String, dynamic> json) =
      _$SymbolRealTimeModelImpl.fromJson;

  @override
  String? get c;
  @override // Optional nullable field (conditions or other info)
  double get p;
  @override // Price
  String get s;
  @override // Symbol
  int get t;
  @override // Timestamp
  double get v;
  @override
  @JsonKey(ignore: true)
  _$$SymbolRealTimeModelImplCopyWith<_$SymbolRealTimeModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
