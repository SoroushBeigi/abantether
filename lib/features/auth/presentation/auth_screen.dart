import 'package:abantether/core/constants/app_constants.dart';
import 'package:abantether/core/result.dart';
import 'package:abantether/di/di.dart';
import 'package:abantether/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:abantether/features/auth/presentation/widgets/email_input.dart';
import 'package:abantether/features/auth/presentation/widgets/password_input.dart';
import 'package:abantether/features/auth/presentation/widgets/submit_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AuthCubit>(),
      child: const _AuthScreen(),
    );
  }
}

class _AuthScreen extends StatelessWidget {
  const _AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isSmallScreen = MediaQuery.of(context).size.width < 600;

    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 500),
          padding: EdgeInsets.all(isSmallScreen ? 16 : 32),
          child: BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state.status == LoginStatus.success) {
                context.go(homePath);
              }

              if (state.status == LoginStatus.error) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text((state.errorMessage ?? const UnknownFailure().message))));
              }
            },
            builder: (context, state) {
              final cubit = context.read<AuthCubit>();

              return AutofillGroup(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Welcome Back',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    const SizedBox(height: 32),
                    EmailInput(cubit: cubit, state: state),
                    const SizedBox(height: 16),
                    PasswordInput(cubit: cubit, state: state),
                    const SizedBox(height: 24),
                    SubmitButton(cubit: cubit, state: state),
                
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Don't have an account?"),
                        TextButton(
                          onPressed: () {
                            //Mock button, no signup feature
                          },
                          child: const Text('Sign Up'),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
