import 'package:abantether/core/constants/app_constants.dart';
import 'package:abantether/core/data_sources/local/key_value_data_source.dart';
import 'package:abantether/core/result.dart';
import 'package:abantether/features/auth/domain/entities/auth.dart';
import 'package:abantether/features/splash/domain/repositories/splash_repository.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: SplashRepository)
class SplashRepositoryImpl extends SplashRepository {
  final KeyValueLocalDataSource _dataSource;
  SplashRepositoryImpl(this._dataSource);

  @override
  Future<Result<Auth>> getToken() async {
    try {
      final authToken = await _dataSource.read<String>(key: tokenLocalKey);
      return Success(Auth(authToken: authToken??''));
    } catch (e) {
      debugPrint(e.toString());
      return const Error(DatabaseFailure());
    }
    
  }
}
