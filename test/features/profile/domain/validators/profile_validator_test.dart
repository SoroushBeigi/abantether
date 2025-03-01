import 'package:abantether/core/constants/profile_error_constants.dart';
import 'package:abantether/features/profile/domain/validators/profile_validator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Phone Number Validation', () {
    test('Empty phone number returns required error', () {
      expect(ProfileValidator.validatePhoneNumber(''), ProfileErrors.phoneRequired);
      expect(ProfileValidator.validatePhoneNumber(null), ProfileErrors.phoneRequired);
    });

    test('Invalid phone number format returns error', () {
      // Test cases that should fail
      expect(ProfileValidator.validatePhoneNumber('12345'), ProfileErrors.invalidPhone); // Too short
      expect(ProfileValidator.validatePhoneNumber('abcdefghij'), ProfileErrors.invalidPhone); // Non-numeric
      expect(ProfileValidator.validatePhoneNumber('+98912'), ProfileErrors.invalidPhone); // Invalid prefix
      expect(ProfileValidator.validatePhoneNumber('0912345678'), ProfileErrors.invalidPhone); // 10 digits (9 after 0)
      expect(ProfileValidator.validatePhoneNumber('+9123456789012'), ProfileErrors.invalidPhone); // Too long
    });

    test('Valid phone number returns null', () {
      // Valid formats
      expect(ProfileValidator.validatePhoneNumber('09123456789'), null); // 11 digits (common format)
      expect(ProfileValidator.validatePhoneNumber('+989123456789'), null); // +98 prefix
      expect(ProfileValidator.validatePhoneNumber('9123456789'), null); // 10 digits (no prefix)
    });
  });
}