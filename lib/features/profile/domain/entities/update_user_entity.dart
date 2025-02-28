import 'package:abantether/features/profile/data/models/update_user_dto.dart';

class UpdateUser{
  final int? id;
  final String? phoneNumber;

  const UpdateUser({this.id,this.phoneNumber});

}

extension UpdateUserToDto on UpdateUser{
  UpdateUserDto toDto()=> UpdateUserDto(phoneNumber: phoneNumber);
}