import 'package:abantether/core/result.dart';
import 'package:abantether/core/use_case.dart';
import 'package:abantether/features/auth/domain/entities/auth.dart';
import 'package:abantether/features/splash/domain/repositories/splash_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetTokenUseCase extends BaseUseCaseNoArgs<Result<Auth>> {
  GetTokenUseCase(this._splashRepository);

  final SplashRepository _splashRepository;

  @override
  Future<Result<Auth>> call() async {
    final result = await _splashRepository.getToken();
    return result;
  }
}
