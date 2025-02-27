// import 'package:abantether/core/constants/app_constants.dart';
// import 'package:abantether/core/network/interceptors/pretty_logger.dart';
// import 'package:abantether/core/network/interceptors/token_interceptor.dart';
// import 'package:dio/dio.dart';
// import 'package:injectable/injectable.dart';

// @injectable
// class DioFactory {
//   final DioTokenInterceptor _tokenInterceptor;
//   final PrettyDioLogger _logger;

//   DioFactory(this._tokenInterceptor, this._logger);

//   Dio create({required String baseUrl}) {
//     final dio = Dio(BaseOptions(baseUrl: baseUrl));

//     dio.interceptors.add(_tokenInterceptor);
//     if (!isReleaseMode) {
//       dio.interceptors.add(_logger);
//     }

//     dio.options.connectTimeout = const Duration(milliseconds: 60000);
//     dio.options.receiveTimeout = const Duration(milliseconds: 60000);
//     dio.options.sendTimeout = const Duration(milliseconds: 60000);

//     return dio;
//   }
// }
