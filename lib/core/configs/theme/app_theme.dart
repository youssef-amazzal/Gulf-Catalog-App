import 'package:flutter/material.dart';
import 'package:gulf_catalog_app/core/configs/theme/app_colors.dart';
import 'package:gulf_catalog_app/core/configs/theme/app_colors_extension.dart';

class AppTheme {
  static final light = ThemeData.light().copyWith(
    extensions: [
      _lightAppColors,
    ],
  );

  static final _lightAppColors = AppColorsExtension(
    accent: const Color(0xff6200ee),
    onAccent: Colors.white,
    error: const Color(0xffb00020),
    onError: Colors.white,
    background: Colors.white,
    surface1: Colors.white,
    surface2: Colors.white,
    surface3: Colors.white,
    onSurfacePrimary: Colors.black,
    onSurfaceSecondary: Colors.black,
    border: Colors.black,
  );

  static final dark = ThemeData.dark().copyWith(
    extensions: [
      _darkAppColors,
    ],
  );

  static final _darkAppColors = AppColorsExtension(
    accent: AppColors.accent,
    onAccent: AppColors.black,
    error: const Color(0xffcf6679),
    onError: AppColors.black,
    background: AppColors.dark4,
    surface1: AppColors.dark3,
    surface2: AppColors.dark2,
    surface3: AppColors.dark1,
    onSurfacePrimary: Colors.white,
    onSurfaceSecondary: AppColors.grey,
    border: AppColors.dark2,
  );
}

extension AppThemeExtension on ThemeData {
  /// Usage example: Theme.of(context).appColors;
  AppColorsExtension get appColors =>
      extension<AppColorsExtension>() ?? AppTheme._lightAppColors;
}

extension ThemeGetter on BuildContext {
  // Usage example: `context.theme`
  ThemeData get theme => Theme.of(this);
}
