import 'package:abantether/core/constants/app_constants.dart';
import 'package:abantether/core/network/interceptors/pretty_logger.dart';
import 'package:abantether/core/network/interceptors/token_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@module
abstract class NetworkModule {
  @singleton
  DioTokenInterceptor get dioTokenInterceptor => DioTokenInterceptor();

  @singleton
  PrettyDioLogger get prettyDioLogger => PrettyDioLogger(
    requestHeader: true,
    requestBody: true,
    responseBody: true,
    responseHeader: true,
    error: true,
    compact: true,
    maxWidth: 120,
  );

  @Named('authDio') 
  @singleton
  Dio get authDio => _createDio(
    baseUrl: baseUrlAuth, 
    tokenInterceptor: dioTokenInterceptor,
    logger: prettyDioLogger,
  );

  @Named('coinsDio') 
  @singleton
  Dio get otherDio => _createDio(
    baseUrl: baseUrlCoins,
    tokenInterceptor: dioTokenInterceptor,
    logger: prettyDioLogger,
  );

  Dio _createDio({
    required String baseUrl,
    required DioTokenInterceptor tokenInterceptor,
    required PrettyDioLogger logger,
  }) {
    final dio = Dio(BaseOptions(baseUrl: baseUrl));
    
    dio.interceptors.add(tokenInterceptor);
    if (!isReleaseMode) {
      dio.interceptors.add(logger);
    }

    dio.options.connectTimeout = const Duration(milliseconds: 60000);
    dio.options.receiveTimeout = const Duration(milliseconds: 60000);
    dio.options.sendTimeout = const Duration(milliseconds: 60000);

    return dio;
  }
}