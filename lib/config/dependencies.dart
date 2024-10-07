import 'package:data_layer/core/api_client.dart';
import 'package:data_layer/core/network_executor.dart';
import 'package:data_layer/data_sources/remote/symbols/symbols_remote_data_source.dart';
import 'package:data_layer/data_sources/remote/symbols/symbols_remote_data_source_impl.dart';
import 'package:data_layer/data_sources/remote/symbols_socket/symbols_socket_data_source.dart';
import 'package:data_layer/data_sources/remote/symbols_socket/symbols_socket_data_source_impl.dart';
import 'package:data_layer/repositories/symbols_repository_impl.dart';
import 'package:domain_layer/repositories/symbols_repository.dart';
import 'package:domain_layer/usecases/get_stock_symbols_use_case.dart';
import 'package:domain_layer/usecases/subscribe_to_symbol_use_case.dart';
import 'package:get_it/get_it.dart';
import 'package:ticker/config/environment.dart';
import 'package:ticker/util/date_helper.dart';

final locator = GetIt.instance;

loadDependencies() async {
  _registerDataSources();
  _registerRepositories();
  _registerUsecases();
  _registerOthers();
}

void _registerDataSources() {
  // ApiClient
  locator.registerLazySingleton<ApiClient>(
      () => ApiClient(baseUrl: 'https://finnhub.io', defaultHeaders: {
            'Content-Type': 'application/json',
          }, defaultQueryParameters: {
            'token': Environment.apiToken
          }));

  // NetworkExecutor
  locator.registerLazySingleton<NetworkExecutor>(
      () => NetworkExecutor(apiClient: locator.get<ApiClient>()));

  // Remote Data Source
  locator.registerLazySingleton<SymbolsRemoteDataSource>(
    () => SymbolsRemoteDataSourceImpl(
      networkExecutor: locator<NetworkExecutor>(),
    ),
  );

  // Socket Data Source
  locator.registerLazySingleton<SymbolsSocketDataSource>(
    () => SymbolsSocketDataSourceImpl(apiToken: Environment.apiToken),
  );
}

_registerRepositories() {
  // SymbolsRepository
  locator.registerLazySingleton<SymbolsRepository>(
    () => SymbolsRepositoryImpl(
      dataSource: locator.get<SymbolsRemoteDataSource>(),
      socketDataSource: locator.get<SymbolsSocketDataSource>(),
    ),
  );
}

_registerUsecases() {
  // GetStockSymbolsUseCase
  locator.registerLazySingleton<GetStockSymbolsUseCase>(
    () => GetStockSymbolsUseCase(
      repository: locator.get<SymbolsRepository>(),
    ),
  );

  // SubscribeToSymbolUseCase
  locator.registerLazySingleton(
      () => SubscribeToSymbolUseCase(locator<SymbolsRepository>()));
}

_registerOthers() {
  // DateHelper
  locator.registerLazySingleton<DateHelper>(() => DateHelper());
}
