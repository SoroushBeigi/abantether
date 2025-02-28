import 'package:abantether/core/result.dart';
import 'package:abantether/core/use_case.dart';
import 'package:abantether/features/profile/domain/entities/user_entity.dart';
import 'package:abantether/features/profile/domain/repositories/profile_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetUserUsecase extends BaseUseCaseNoArgs<Result<User>> {
  GetUserUsecase(this._profileRepository);

  final ProfileRepository _profileRepository;

  @override
  Future<Result<User>> call() async {
    final result = await _profileRepository.getUserInfo();
    return result;
  }
}
