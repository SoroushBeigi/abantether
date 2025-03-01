import 'package:abantether/core/constants/profile_error_constants.dart';

class ProfileValidator {
  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) return ProfileErrors.phoneRequired;
    if (!RegExp(r'^(?:(?:\+98|0)?9\d{9})$')
        .hasMatch(value)) {
      return ProfileErrors.invalidPhone;
    }
    return null;
  }

}