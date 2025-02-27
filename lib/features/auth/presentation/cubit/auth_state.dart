part of 'auth_cubit.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    @Default('') String email,
    @Default('') String password,
    String? emailError,
    String? passwordError,
    @Default(LoginStatus.initial) LoginStatus status,
    String? errorMessage,
  }) = _AuthState;

  factory AuthState.initial() => const AuthState();
}

enum LoginStatus { initial, submitting, success, error }
