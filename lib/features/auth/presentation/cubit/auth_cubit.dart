import 'package:abantether/core/constants/auth_error_constants.dart';
import 'package:abantether/core/result.dart';
import 'package:abantether/features/auth/domain/entities/login_credentials_entity.dart';
import 'package:abantether/features/auth/domain/usecases/login_usecase.dart';
import 'package:abantether/features/auth/domain/validators/auth_validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'auth_state.dart';
part 'auth_cubit.freezed.dart';

@injectable
class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._loginUseCase) : super(AuthState.initial());
  final LoginUseCase _loginUseCase;

  void emailChanged(String value) {
    emit(state.copyWith(
      email: value,
      emailError: AuthValidator.validateEmail(value),
    ));
  }

  void passwordChanged(String value) {
    emit(state.copyWith(
      password: value,
      passwordError: AuthValidator.validatePassword(value),
    ));
  }

  Future<void> submit() async {
    if (state.emailError != null || state.passwordError != null) return;

    emit(state.copyWith(status: LoginStatus.submitting));

    final result = await _loginUseCase(LoginCredentials(email: state.email, password: state.password));
    result.fold(
      onSuccess: (data) {
        emit(state.copyWith(status: LoginStatus.success));
      },
      onError: (failure) {
        emit(state.copyWith(
          status: LoginStatus.error,
          errorMessage: failure.message,
        ));
        emit(state.copyWith(status: LoginStatus.initial,));
      },
    );
    
  }
}
