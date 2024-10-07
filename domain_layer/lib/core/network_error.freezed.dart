// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'network_error.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$NetworkError {
  String get message => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, String? errorCode) request,
    required TResult Function(String message) type,
    required TResult Function(String message) connectivity,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, String? errorCode)? request,
    TResult? Function(String message)? type,
    TResult? Function(String message)? connectivity,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, String? errorCode)? request,
    TResult Function(String message)? type,
    TResult Function(String message)? connectivity,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RequestError value) request,
    required TResult Function(TypeError value) type,
    required TResult Function(ConnectivityError value) connectivity,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RequestError value)? request,
    TResult? Function(TypeError value)? type,
    TResult? Function(ConnectivityError value)? connectivity,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RequestError value)? request,
    TResult Function(TypeError value)? type,
    TResult Function(ConnectivityError value)? connectivity,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NetworkErrorCopyWith<NetworkError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NetworkErrorCopyWith<$Res> {
  factory $NetworkErrorCopyWith(
          NetworkError value, $Res Function(NetworkError) then) =
      _$NetworkErrorCopyWithImpl<$Res, NetworkError>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$NetworkErrorCopyWithImpl<$Res, $Val extends NetworkError>
    implements $NetworkErrorCopyWith<$Res> {
  _$NetworkErrorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RequestErrorImplCopyWith<$Res>
    implements $NetworkErrorCopyWith<$Res> {
  factory _$$RequestErrorImplCopyWith(
          _$RequestErrorImpl value, $Res Function(_$RequestErrorImpl) then) =
      __$$RequestErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, String? errorCode});
}

/// @nodoc
class __$$RequestErrorImplCopyWithImpl<$Res>
    extends _$NetworkErrorCopyWithImpl<$Res, _$RequestErrorImpl>
    implements _$$RequestErrorImplCopyWith<$Res> {
  __$$RequestErrorImplCopyWithImpl(
      _$RequestErrorImpl _value, $Res Function(_$RequestErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? errorCode = freezed,
  }) {
    return _then(_$RequestErrorImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      errorCode: freezed == errorCode
          ? _value.errorCode
          : errorCode // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$RequestErrorImpl implements RequestError {
  const _$RequestErrorImpl({required this.message, this.errorCode});

  @override
  final String message;
  @override
  final String? errorCode;

  @override
  String toString() {
    return 'NetworkError.request(message: $message, errorCode: $errorCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RequestErrorImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.errorCode, errorCode) ||
                other.errorCode == errorCode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, errorCode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RequestErrorImplCopyWith<_$RequestErrorImpl> get copyWith =>
      __$$RequestErrorImplCopyWithImpl<_$RequestErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, String? errorCode) request,
    required TResult Function(String message) type,
    required TResult Function(String message) connectivity,
  }) {
    return request(message, errorCode);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, String? errorCode)? request,
    TResult? Function(String message)? type,
    TResult? Function(String message)? connectivity,
  }) {
    return request?.call(message, errorCode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, String? errorCode)? request,
    TResult Function(String message)? type,
    TResult Function(String message)? connectivity,
    required TResult orElse(),
  }) {
    if (request != null) {
      return request(message, errorCode);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RequestError value) request,
    required TResult Function(TypeError value) type,
    required TResult Function(ConnectivityError value) connectivity,
  }) {
    return request(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RequestError value)? request,
    TResult? Function(TypeError value)? type,
    TResult? Function(ConnectivityError value)? connectivity,
  }) {
    return request?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RequestError value)? request,
    TResult Function(TypeError value)? type,
    TResult Function(ConnectivityError value)? connectivity,
    required TResult orElse(),
  }) {
    if (request != null) {
      return request(this);
    }
    return orElse();
  }
}

abstract class RequestError implements NetworkError {
  const factory RequestError(
      {required final String message,
      final String? errorCode}) = _$RequestErrorImpl;

  @override
  String get message;
  String? get errorCode;
  @override
  @JsonKey(ignore: true)
  _$$RequestErrorImplCopyWith<_$RequestErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TypeErrorImplCopyWith<$Res>
    implements $NetworkErrorCopyWith<$Res> {
  factory _$$TypeErrorImplCopyWith(
          _$TypeErrorImpl value, $Res Function(_$TypeErrorImpl) then) =
      __$$TypeErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$TypeErrorImplCopyWithImpl<$Res>
    extends _$NetworkErrorCopyWithImpl<$Res, _$TypeErrorImpl>
    implements _$$TypeErrorImplCopyWith<$Res> {
  __$$TypeErrorImplCopyWithImpl(
      _$TypeErrorImpl _value, $Res Function(_$TypeErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$TypeErrorImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$TypeErrorImpl implements TypeError {
  const _$TypeErrorImpl({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'NetworkError.type(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TypeErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TypeErrorImplCopyWith<_$TypeErrorImpl> get copyWith =>
      __$$TypeErrorImplCopyWithImpl<_$TypeErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, String? errorCode) request,
    required TResult Function(String message) type,
    required TResult Function(String message) connectivity,
  }) {
    return type(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, String? errorCode)? request,
    TResult? Function(String message)? type,
    TResult? Function(String message)? connectivity,
  }) {
    return type?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, String? errorCode)? request,
    TResult Function(String message)? type,
    TResult Function(String message)? connectivity,
    required TResult orElse(),
  }) {
    if (type != null) {
      return type(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RequestError value) request,
    required TResult Function(TypeError value) type,
    required TResult Function(ConnectivityError value) connectivity,
  }) {
    return type(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RequestError value)? request,
    TResult? Function(TypeError value)? type,
    TResult? Function(ConnectivityError value)? connectivity,
  }) {
    return type?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RequestError value)? request,
    TResult Function(TypeError value)? type,
    TResult Function(ConnectivityError value)? connectivity,
    required TResult orElse(),
  }) {
    if (type != null) {
      return type(this);
    }
    return orElse();
  }
}

abstract class TypeError implements NetworkError {
  const factory TypeError({required final String message}) = _$TypeErrorImpl;

  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$TypeErrorImplCopyWith<_$TypeErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ConnectivityErrorImplCopyWith<$Res>
    implements $NetworkErrorCopyWith<$Res> {
  factory _$$ConnectivityErrorImplCopyWith(_$ConnectivityErrorImpl value,
          $Res Function(_$ConnectivityErrorImpl) then) =
      __$$ConnectivityErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ConnectivityErrorImplCopyWithImpl<$Res>
    extends _$NetworkErrorCopyWithImpl<$Res, _$ConnectivityErrorImpl>
    implements _$$ConnectivityErrorImplCopyWith<$Res> {
  __$$ConnectivityErrorImplCopyWithImpl(_$ConnectivityErrorImpl _value,
      $Res Function(_$ConnectivityErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ConnectivityErrorImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ConnectivityErrorImpl implements ConnectivityError {
  const _$ConnectivityErrorImpl({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'NetworkError.connectivity(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConnectivityErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ConnectivityErrorImplCopyWith<_$ConnectivityErrorImpl> get copyWith =>
      __$$ConnectivityErrorImplCopyWithImpl<_$ConnectivityErrorImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, String? errorCode) request,
    required TResult Function(String message) type,
    required TResult Function(String message) connectivity,
  }) {
    return connectivity(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, String? errorCode)? request,
    TResult? Function(String message)? type,
    TResult? Function(String message)? connectivity,
  }) {
    return connectivity?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, String? errorCode)? request,
    TResult Function(String message)? type,
    TResult Function(String message)? connectivity,
    required TResult orElse(),
  }) {
    if (connectivity != null) {
      return connectivity(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RequestError value) request,
    required TResult Function(TypeError value) type,
    required TResult Function(ConnectivityError value) connectivity,
  }) {
    return connectivity(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RequestError value)? request,
    TResult? Function(TypeError value)? type,
    TResult? Function(ConnectivityError value)? connectivity,
  }) {
    return connectivity?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RequestError value)? request,
    TResult Function(TypeError value)? type,
    TResult Function(ConnectivityError value)? connectivity,
    required TResult orElse(),
  }) {
    if (connectivity != null) {
      return connectivity(this);
    }
    return orElse();
  }
}

abstract class ConnectivityError implements NetworkError {
  const factory ConnectivityError({required final String message}) =
      _$ConnectivityErrorImpl;

  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$ConnectivityErrorImplCopyWith<_$ConnectivityErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
