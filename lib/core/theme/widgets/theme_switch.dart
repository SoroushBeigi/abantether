import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../theme_cubit.dart';

class ThemeSwitchIcon extends StatelessWidget {
  const ThemeSwitchIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return IconButton(
          icon: Icon(state.whenOrNull(dark: () => Icons.light_mode)??Icons.dark_mode),
          onPressed: () => context.read<ThemeCubit>().toggleTheme(),
        );
      },
    );
  }
}
