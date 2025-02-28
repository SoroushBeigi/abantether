import 'package:abantether/core/data_sources/user_local_data_source.dart';
import 'package:abantether/core/result.dart';
import 'package:abantether/features/auth/data/mappers/auth_mapper.dart';
import 'package:abantether/features/auth/data/remote/auth_service.dart';
import 'package:abantether/features/auth/domain/entities/auth.dart';
import 'package:abantether/features/auth/domain/entities/login_credentials_entity.dart';
import 'package:abantether/features/auth/domain/repositories/auth_repository.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl extends AuthRepository {
  final AuthService _service;
  final UserLocalDataSource _localDataSource;

  AuthRepositoryImpl(this._service, this._localDataSource);

 @override
Future<Result<Auth>> login(LoginCredentials credentials) async {
  try {
    final result = await _service.login(credentials.toModel().toJson());
    final authModel = result.data;
    await _localDataSource.writeToken(authModel.toEntity());
    return Success(authModel.toEntity());
    
  } on DioException catch (e) {
    if (e.response != null) {
      final statusCode = e.response!.statusCode;
      final data = e.response!.data;
      if (data is Map<String, dynamic> && (data['message'] !=null)) {
        return Error(CustomFailure(data['message']));
      }
      if (statusCode! >= 500) {
        return const Error(ServerFailure());
      }
      if (statusCode >= 400) {
        return const Error(ClientFailure());
      }
    }
    
    return const Error(NetworkFailure());
    
  } catch (e) {
    return const Error(UnknownFailure());
  }
}
}
