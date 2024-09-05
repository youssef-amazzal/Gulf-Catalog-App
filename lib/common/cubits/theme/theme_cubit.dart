import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class ThemeCubit extends HydratedCubit<ThemeMode> {
  ThemeCubit() : super(ThemeMode.system);

  void updateTheme(ThemeMode themeMode) => emit(themeMode);
  void toggleTheme() {
    final themeMode =
        state == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    emit(themeMode);
  }

  @override
  ThemeMode? fromJson(Map<String, dynamic> json) {
    final themeModeString = json['themeMode'] as String?;
    if (themeModeString == null) return null;
    return ThemeMode.values.firstWhere(
      (e) => e.toString() == themeModeString,
      orElse: () => ThemeMode.system,
    );
  }

  @override
  Map<String, dynamic>? toJson(ThemeMode state) {
    return {'themeMode': state.toString()};
  }
}
