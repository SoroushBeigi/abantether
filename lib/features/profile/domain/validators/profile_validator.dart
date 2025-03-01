import 'package:abantether/core/constants/profile_error_constants.dart';

class ProfileValidator {
  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) return ProfileErrors.phoneRequired;
    if (!RegExp(r'^(?:[+0]9)?[0-9]{10}$')
        .hasMatch(value)) {
      return ProfileErrors.invalidPhone;
    }
    return null;
  }

}