import 'package:abantether/features/auth/data/models/login_dto.dart';

class LoginCredentials {
  final String email;
  final String password;
  
  const LoginCredentials({
    required this.email,
    required this.password,
  });
}

extension AuthEntityMapper on LoginCredentials {
  LoginDto toModel() => LoginDto(email: email, password: password);
}
