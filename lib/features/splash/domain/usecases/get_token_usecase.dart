import 'package:abantether/core/result.dart';
import 'package:abantether/core/use_case.dart';
import 'package:abantether/features/auth/domain/entities/auth.dart';
import 'package:abantether/features/splash/domain/repositories/splash_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetTokenUsecase extends BaseUseCaseNoArgs<Result<Auth>> {
  GetTokenUsecase(this._splashRepository);

  final SplashRepository _splashRepository;

  @override
  Future<Result<Auth>> call() async {
    final result = await _splashRepository.getToken();
    return result;
  }
}
