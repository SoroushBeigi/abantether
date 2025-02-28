import 'package:abantether/core/result.dart';
import 'package:abantether/features/profile/domain/entities/update_user_entity.dart';
import 'package:abantether/features/profile/domain/entities/user_entity.dart';

abstract class ProfileRepository {
  Future<Result<User>> getUserInfo();

  Future<Result<User>> updateUserInfo({required UpdateUser updateUser});
}
