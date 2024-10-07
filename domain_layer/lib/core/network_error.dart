// domain_layer/lib/core/network_error.dart

import 'package:freezed_annotation/freezed_annotation.dart';

part 'network_error.freezed.dart';

@freezed
class NetworkError with _$NetworkError {
  const factory NetworkError.request({
    required String message,
    String? errorCode,
  }) = RequestError;

  const factory NetworkError.type({
    required String message,
  }) = TypeError;

  const factory NetworkError.connectivity({
    required String message,
  }) = ConnectivityError;
}
