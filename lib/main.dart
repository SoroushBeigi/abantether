import 'package:abantether/di/di.dart';
import 'package:abantether/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'core/theme/app_theme.dart';
import 'core/theme/theme_cubit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  const secureStorage = FlutterSecureStorage();

  getIt.registerLazySingleton<FlutterSecureStorage>(() => secureStorage);
  configureDependencies();

  runApp(
    BlocProvider(
      create: (context) => getIt<ThemeCubit>(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: router,
          theme: AppTheme.light,
          darkTheme: AppTheme.dark,
          themeMode: state.when(
            light: () => ThemeMode.light,
            dark: () => ThemeMode.dark,
            system: () => ThemeMode.system,
          ),
        );
      },
    );
  }
}
