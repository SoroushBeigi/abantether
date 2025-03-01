import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'theme_state.dart';
part 'theme_cubit.freezed.dart';

@singleton
class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(const ThemeState.light());

  void toggleTheme() {
    if (state is _Light) {
      emit(const ThemeState.dark());
    } else {
      emit(const ThemeState.light());
    }
  }

  void setThemeMode(ThemeState theme) => emit(theme);
}

