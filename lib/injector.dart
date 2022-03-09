import 'package:flutball/core/utils/constants.dart';
import 'package:flutball/data/datasources/remote/football_api_service.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';

final GetIt injector = GetIt.instance
  ..registerLazySingleton<Dio>(() => Dio()..options.headers["X-Auth-Token"] = kApiKey)

  //football dependencies
  ..registerLazySingleton<FootballApiService>(() => FootballApiService(injector()));
