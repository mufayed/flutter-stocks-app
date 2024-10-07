import 'package:domain_layer/core/network_error.dart';
import 'package:domain_layer/core/result.dart';
import 'package:http/http.dart' as http;
import 'api_client.dart';

class NetworkExecutor {
  final ApiClient apiClient;

  NetworkExecutor({
    required this.apiClient,
  });

  /*a generic method to execute network requests
    & it returns a Result object based on the type we pass */
  Future<Result<T>> execute<T>({
    required Future<http.Response> Function(ApiClient client) request,
    required T Function(String responseBody) responseParser,
  }) async {
    try {
      final response = await request(apiClient);

      if (response.statusCode == 200) {
        final T data = responseParser(response.body);
        return Result.success(data);
      } else {
        return Result.failure(
          NetworkError.request(
            message: 'Server Error: ${response.reasonPhrase}',
            errorCode: response.statusCode.toString(),
          ),
        );
      }
    } on http.ClientException catch (e) {
      return Result.failure(
        NetworkError.connectivity(message: 'Client exception: ${e.message}'),
      );
    } on FormatException catch (e) {
      return Result.failure(
        NetworkError.type(message: 'Data format error: ${e.message}'),
      );
    } catch (e) {
      return Result.failure(
        NetworkError.type(message: 'Unexpected error: $e'),
      );
    }
  }
}
