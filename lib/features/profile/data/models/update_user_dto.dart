class UpdateUserDto {
  final String? phoneNumber;

  const UpdateUserDto({this.phoneNumber});

  Map<String, dynamic> toJson() => {'phone_number': phoneNumber};
}
