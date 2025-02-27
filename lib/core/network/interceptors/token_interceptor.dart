import 'package:abantether/core/data_sources/user_local_data_source.dart';
import 'package:abantether/di/di.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

class DioTokenInterceptor extends Interceptor {
  @singleton
  UserLocalDataSource get _userDataSource => getIt<UserLocalDataSource>();

  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final resultToken = await _userDataSource.readToken();
    if (resultToken.authToken?.isNotEmpty ?? false) {
      final List<MapEntry<String, dynamic>> tokenHeader = [
        MapEntry('Token', resultToken.authToken),
      ];
      options.headers.addEntries(tokenHeader);
    }
    handler.next(options);
  }

}
