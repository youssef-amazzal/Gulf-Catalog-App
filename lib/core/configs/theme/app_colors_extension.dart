import 'package:flutter/material.dart';

class AppColorsExtension extends ThemeExtension<AppColorsExtension> {
  AppColorsExtension({
    required this.accent,
    required this.onAccent,
    required this.error,
    required this.onError,
    required this.background,
    required this.surface1,
    required this.surface2,
    required this.surface3,
    required this.onSurfacePrimary,
    required this.onSurfaceSecondary1,
    required this.onSurfaceSecondary2,
    required this.border,
  });

  final Color accent;
  final Color onAccent;
  final Color error;
  final Color onError;
  final Color background;
  final Color surface1;
  final Color surface2;
  final Color surface3;
  final Color onSurfacePrimary;
  final Color onSurfaceSecondary1;
  final Color onSurfaceSecondary2;
  final Color border;

  @override
  ThemeExtension<AppColorsExtension> copyWith({
    Color? accent,
    Color? onAccent,
    Color? error,
    Color? onError,
    Color? background,
    Color? surface1,
    Color? surface2,
    Color? surface3,
    Color? onSurfacePrimary,
    Color? onSurfaceSecondary1,
    Color? onSurfaceSecondary2,
    Color? border,
  }) {
    return AppColorsExtension(
      accent: accent ?? this.accent,
      onAccent: onAccent ?? this.onAccent,
      error: error ?? this.error,
      onError: onError ?? this.onError,
      background: background ?? this.background,
      surface1: surface1 ?? this.surface1,
      surface2: surface2 ?? this.surface2,
      surface3: surface3 ?? this.surface3,
      onSurfacePrimary: onSurfacePrimary ?? this.onSurfacePrimary,
      onSurfaceSecondary1: onSurfaceSecondary1 ?? this.onSurfaceSecondary1,
      onSurfaceSecondary2: onSurfaceSecondary2 ?? this.onSurfaceSecondary2,
      border: border ?? this.border,
    );
  }

  @override
  ThemeExtension<AppColorsExtension> lerp(
    covariant ThemeExtension<AppColorsExtension>? other,
    double t,
  ) {
    if (other is! AppColorsExtension) {
      return this;
    }

    return AppColorsExtension(
      accent: Color.lerp(accent, other.accent, t)!,
      onAccent: Color.lerp(onAccent, other.onAccent, t)!,
      error: Color.lerp(error, other.error, t)!,
      onError: Color.lerp(onError, other.onError, t)!,
      background: Color.lerp(background, other.background, t)!,
      surface1: Color.lerp(surface1, other.surface1, t)!,
      surface2: Color.lerp(surface2, other.surface2, t)!,
      surface3: Color.lerp(surface3, other.surface3, t)!,
      onSurfacePrimary:
          Color.lerp(onSurfacePrimary, other.onSurfacePrimary, t)!,
      onSurfaceSecondary1:
          Color.lerp(onSurfaceSecondary1, other.onSurfaceSecondary1, t)!,
      onSurfaceSecondary2:
          Color.lerp(onSurfaceSecondary2, other.onSurfaceSecondary2, t)!,
      border: Color.lerp(border, other.border, t)!,
    );
  }
}
