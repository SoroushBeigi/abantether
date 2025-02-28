import 'package:abantether/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  final AuthCubit cubit;
  final AuthState state;

  const SubmitButton({super.key, required this.cubit, required this.state});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      child: ElevatedButton(
        onPressed: disabled(state) ? null : cubit.submit,
        child: state.status == LoginStatus.submitting
            ? const SizedBox(height: 20, width: 20, child: CircularProgressIndicator())
            : const Text('Sign In'),
      ),
    );
  }

  bool disabled(AuthState state) =>
      state.status == LoginStatus.submitting ||
      state.email.isEmpty ||
      state.password.isEmpty ||
      (state.emailError?.isNotEmpty ?? false) ||
      (state.passwordError?.isNotEmpty ?? false);
}
