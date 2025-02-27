import 'package:abantether/core/result.dart';
import 'package:abantether/core/use_case.dart';
import 'package:abantether/features/auth/domain/entities/auth.dart';
import 'package:abantether/features/auth/domain/entities/login_credentials_entity.dart';
import 'package:abantether/features/auth/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class LoginUseCase extends BaseUseCase<Result<Auth>,LoginCredentials> {
  LoginUseCase(this._authRepository);

  final AuthRepository _authRepository;

  @override
  Future<Result<Auth>> call(arg) async {
    final result = await _authRepository.login(arg);
    return result;
  }
}
