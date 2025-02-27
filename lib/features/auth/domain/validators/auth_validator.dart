import 'package:abantether/core/constants/auth_error_constants.dart';

class AuthValidator {
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) return AuthErrors.emailRequired;
    if (!RegExp(r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$')
        .hasMatch(value)) {
      return AuthErrors.invalidEmail;
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) return AuthErrors.passwordRequired;
    if (value.length < 6) return AuthErrors.passwordLength;
    if (!RegExp(r'(?=.*[A-Z])').hasMatch(value)) return AuthErrors.passwordUppercase;
    if (!RegExp(r'(?=.*[a-z])').hasMatch(value)) return AuthErrors.passwordLowercase;
    if (!RegExp(r'(?=.*\d)').hasMatch(value)) return AuthErrors.passwordNumber;
    return null;
  }
}