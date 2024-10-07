import 'network_error.dart';

/* a generic class to handle the result of network requests
  it can be success or failure */
class Result<T> {
  final T? data;
  final NetworkError? error;
  final bool isSuccess;

  Result._({this.data, this.error, required this.isSuccess});

  factory Result.success(T? data) => Result._(data: data, isSuccess: true);

  factory Result.failure(NetworkError? error) =>
      Result._(error: error, isSuccess: false);
}
