import 'package:abantether/core/result.dart';
import 'package:abantether/features/auth/domain/entities/auth.dart';
import 'package:abantether/features/auth/domain/entities/login_credentials_entity.dart';

abstract class AuthRepository {
  Future<Result<Auth>> login(LoginCredentials credentials);
}
