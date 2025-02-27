import 'package:abantether/core/data_sources/user_local_data_source.dart';
import 'package:abantether/core/result.dart';
import 'package:abantether/features/auth/data/mappers/auth_mapper.dart';
import 'package:abantether/features/auth/data/models/auth_model.dart';
import 'package:abantether/features/auth/data/remote/auth_service.dart';
import 'package:abantether/features/auth/domain/entities/auth.dart';
import 'package:abantether/features/auth/domain/entities/login_credentials_entity.dart';
import 'package:abantether/features/auth/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl extends AuthRepository {
  final AuthService _service;
  final UserLocalDataSource _localDataSource;

  AuthRepositoryImpl(this._service, this._localDataSource);

  @override
  Future<Result<Auth>> login(LoginCredentials credentials) async {
    final result = await _service.login(credentials.toJson());

    if (result.response.statusCode == 200) {
      final authModel = AuthModel.fromJson(result.response.data);

      await _localDataSource.writeToken(authModel.toEntity());

      return Success(authModel.toEntity());

    } else if (result.response.statusCode.toString()[0] == '5') {
      return const Error(ServerFailure());

    } else if (result.response.statusCode.toString()[0] == '4') {
      return const Error(ClientFailure());

    } else {
      return const Error(UnknownFailure());
    }
  }
}
