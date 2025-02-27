import 'package:abantether/core/data_sources/user_local_data_source.dart';
import 'package:abantether/core/result.dart';
import 'package:abantether/features/auth/domain/entities/auth.dart';
import 'package:abantether/features/splash/domain/repositories/splash_repository.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: SplashRepository)
class SplashRepositoryImpl extends SplashRepository {
  final UserLocalDataSource _dataSource;
  SplashRepositoryImpl(this._dataSource);

  @override
  Future<Result<Auth>> getToken() async {
    try {
      final auth = await _dataSource.readToken();
      return Success(Auth(authToken: auth.authToken??''));
    } catch (e) {
      debugPrint(e.toString());
      return const Error(DatabaseFailure());
    }
    
  }
}
