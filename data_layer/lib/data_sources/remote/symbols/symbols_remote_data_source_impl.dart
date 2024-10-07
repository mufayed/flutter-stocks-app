import 'dart:convert';

import 'package:data_layer/core/api_paths.dart';
import 'package:data_layer/core/network_executor.dart';
import 'package:data_layer/data_sources/remote/symbols/symbols_remote_data_source.dart';
import 'package:data_layer/models/symbol/symbol_model.dart';
import 'package:domain_layer/core/result.dart';

class SymbolsRemoteDataSourceImpl implements SymbolsRemoteDataSource {
  final NetworkExecutor networkExecutor;

  SymbolsRemoteDataSourceImpl({
    required this.networkExecutor,
  });

  @override
  Future<Result<List<SymbolModel>>> fetchStockSymbols() async {
    final result = await networkExecutor.execute<List<SymbolModel>>(
      request: (apiClient) => apiClient.get(
        ApiPaths.forexSymbols,
        queryParameters: {
          'exchange': 'oanda',
        },
      ),
      responseParser: (responseBody) {
        // parse the response body
        final List<dynamic> jsonData = json.decode(responseBody);
        return jsonData
            .map((item) => SymbolModel.fromJson(item as Map<String, dynamic>))
            .toList();
      },
    );

    return result;
  }
}
