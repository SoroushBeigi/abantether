import 'package:abantether/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';

class PasswordInput extends StatelessWidget {
  final AuthCubit cubit;
  final AuthState state;

  const PasswordInput({super.key, required this.cubit, required this.state});

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: true,
      autofillHints: const [AutofillHints.password],
      onChanged: cubit.passwordChanged,
      decoration: InputDecoration(
        labelText: 'Password',
        errorText: state.passwordError,
        prefixIcon: const Icon(Icons.lock),
        border: const OutlineInputBorder(),
      ),
    );
  }
}