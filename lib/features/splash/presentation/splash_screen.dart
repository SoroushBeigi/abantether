import 'package:abantether/core/result.dart';
import 'package:abantether/di/di.dart';
import 'package:abantether/features/splash/presentation/cubit/cubit/splash_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<SplashCubit>(),
      child: const _SplashScreen(),
    );
  }
}

class _SplashScreen extends StatelessWidget {
  const _SplashScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[700],
      body: BlocListener<SplashCubit, SplashState>(
        listener: (context, state) {
          state.whenOrNull(
            navigateToAuth: () => context.go('/auth'),
            navigateToHome: () => context.go('/home'),
            error: (error) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(error ?? const UnknownFailure().message)),
              );
            },
          );
        },
        child: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.account_balance_wallet,
                size: 100,
                color: Colors.white,
              ),
              SizedBox(height: 20),
              Text(
                'Aban Tether',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
