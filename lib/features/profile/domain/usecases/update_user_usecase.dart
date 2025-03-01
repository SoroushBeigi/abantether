import 'package:abantether/core/result.dart';
import 'package:abantether/core/use_case.dart';
import 'package:abantether/features/profile/domain/entities/update_user_entity.dart';
import 'package:abantether/features/profile/domain/entities/user_entity.dart';
import 'package:abantether/features/profile/domain/repositories/profile_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class UpdateUserUseCase extends BaseUseCase<Result<User>, UpdateUser> {
  UpdateUserUseCase(this._profileRepository);

  final ProfileRepository _profileRepository;

  @override
  Future<Result<User>> call(arg) async {
    final result = await _profileRepository.updateUserInfo(updateUser: arg);
    return result;
  }
}
