import 'package:abantether/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';

class EmailInput extends StatelessWidget {
  final AuthCubit cubit;
  final AuthState state;

  const EmailInput({super.key, required this.cubit, required this.state});

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      autofillHints: const [AutofillHints.email],
      onChanged: cubit.emailChanged,
      decoration: InputDecoration(
        labelText: 'Email',
        errorText: state.emailError,
        prefixIcon: const Icon(Icons.email),
        border: const OutlineInputBorder(),
      ),
    );
  }
}
