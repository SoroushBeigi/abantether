import 'package:abantether/core/constants/app_constants.dart';
import 'package:abantether/core/data_sources/local/key_value_data_source.dart';
import 'package:abantether/di/di.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

class DioTokenInterceptor extends Interceptor {
  @singleton
  KeyValueLocalDataSource get _userDataSource => getIt<KeyValueLocalDataSource>();

  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final authToken = await _userDataSource.read<String>(key: tokenLocalKey);
    if (authToken?.isNotEmpty ?? false) {
      final List<MapEntry<String, dynamic>> tokenHeader = [
        MapEntry('Authorization','Bearer $authToken'),
      ];
      options.headers.addEntries(tokenHeader);
    }
    handler.next(options);
  }

}
