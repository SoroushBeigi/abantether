import 'package:abantether/core/constants/auth_error_constants.dart';
import 'package:abantether/features/auth/domain/validators/auth_validator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Email Validation', () {
    test('Empty email returns required error', () {
      expect(AuthValidator.validateEmail(''), AuthErrors.emailRequired);
    });

    test('Invalid email format returns error', () {
      expect(AuthValidator.validateEmail('invalid-email'), AuthErrors.invalidEmail);
      expect(AuthValidator.validateEmail('user@'), AuthErrors.invalidEmail);
      expect(AuthValidator.validateEmail('user@domain.'), AuthErrors.invalidEmail);
    });

    test('Valid email returns null', () {
      expect(AuthValidator.validateEmail('valid@example.com'), null);
      expect(AuthValidator.validateEmail('r.shakiba@abantether.com'), null);
      expect(AuthValidator.validateEmail('sbeygi712@gmail.com'), null);
    });
  });

  group('Password Validation', () {
    test('Empty password returns required error', () {
      expect(AuthValidator.validatePassword(''), AuthErrors.passwordRequired);
    });

    test('Short password returns length error', () {
      expect(AuthValidator.validatePassword('Short'), AuthErrors.passwordLength);
    });

    test('Missing uppercase returns error', () {
      expect(AuthValidator.validatePassword('lowercase123'), AuthErrors.passwordUppercase);
    });

    test('Missing lowercase returns error', () {
      expect(AuthValidator.validatePassword('UPPERCASE123'), AuthErrors.passwordLowercase);
    });

    test('Missing number returns error', () {
      expect(AuthValidator.validatePassword('NoNumbersHere'), AuthErrors.passwordNumber);
    });

    test('Valid password returns null', () {
      expect(AuthValidator.validatePassword('ValidPass123'), null);
      expect(AuthValidator.validatePassword('Another1Password'), null);
      expect(AuthValidator.validatePassword('Aa1234567890!'), null);
    });
  });
}