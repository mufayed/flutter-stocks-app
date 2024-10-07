import 'package:http/http.dart' as http;

class ApiClient {
  final String _baseUrl;
  final Map<String, String> _defaultHeaders;
  final Map<String, String> _defaultQueryParameters;

  ApiClient({
    required String baseUrl,
    Map<String, String>? defaultHeaders,
    Map<String, String>? defaultQueryParameters,
  })  : _baseUrl = baseUrl,
        _defaultHeaders = defaultHeaders ?? {},
        _defaultQueryParameters = defaultQueryParameters ?? {};

  Future<http.Response> get(
      String path, {
        Map<String, String>? headers,
        Map<String, String>? queryParameters, // Changed to Map<String, String>
      }) async {
    final combinedQueryParameters = {
      ..._defaultQueryParameters,
      ...?queryParameters,
    };
    final uri = Uri.parse('$_baseUrl$path').replace(queryParameters: combinedQueryParameters);

    final combinedHeaders = {..._defaultHeaders, ...?headers};

    final response = await http.get(uri, headers: combinedHeaders);
    return response;
  }
}
