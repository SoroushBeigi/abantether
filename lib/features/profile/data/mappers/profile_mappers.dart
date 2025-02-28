import 'package:abantether/features/profile/data/models/user_model.dart';
import 'package:abantether/features/profile/domain/entities/user_entity.dart';

extension UserModelToEntity on UserModel {
  User toEntity() => User(
        id: id,
        email: email,
        name: name,
        phoneNumber: phoneNumber,
      );
}
