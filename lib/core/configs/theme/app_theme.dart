import 'package:flutter/material.dart';
import 'package:gulf_catalog_app/core/configs/theme/app_colors.dart';
import 'package:gulf_catalog_app/core/configs/theme/app_colors_extension.dart';
import 'package:gulf_catalog_app/core/configs/theme/app_typography.dart';
import 'package:gulf_catalog_app/core/configs/theme/app_typography_extension.dart';

class AppTheme {
  static final light = ThemeData.light().copyWith(
    extensions: [
      _lightAppColors,
      _lightTextStyle,
    ],
  );

  static final _lightAppColors = AppColorsExtension(
    accent: AppColors.lightAccent,
    onAccent: AppColors.white,
    error: const Color(0xffb00020),
    onError: Colors.white,
    background: AppColors.light4,
    surface1: AppColors.light3,
    surface2: AppColors.light2,
    surface3: AppColors.light1,
    onSurfacePrimary: Colors.black,
    onSurfaceSecondary1: AppColors.lightGrey1,
    onSurfaceSecondary2: AppColors.lightGrey2,
    border: AppColors.light0,
  );

  static final _lightTextStyle = AppTypographyExtension(
      body1:
          AppTypography.body1.copyWith(color: _lightAppColors.onSurfacePrimary),
      bodyAlt1: AppTypography.body1
          .copyWith(color: _lightAppColors.onSurfaceSecondary1),
      h1: AppTypography.h1.copyWith(color: _lightAppColors.onSurfacePrimary));

  static final dark = ThemeData.dark().copyWith(
    extensions: [_darkAppColors, _darkTextStyle],
  );

  static final _darkAppColors = AppColorsExtension(
    accent: AppColors.darkAccent,
    onAccent: AppColors.black,
    error: const Color(0xffcf6679),
    onError: AppColors.black,
    background: AppColors.dark4,
    surface1: AppColors.dark3,
    surface2: AppColors.dark2,
    surface3: AppColors.dark1,
    onSurfacePrimary: Colors.white,
    onSurfaceSecondary1: AppColors.darkGrey1,
    onSurfaceSecondary2: AppColors.darkGrey2,
    border: AppColors.dark0,
  );

  static final _darkTextStyle = AppTypographyExtension(
      body1:
          AppTypography.body1.copyWith(color: _darkAppColors.onSurfacePrimary),
      bodyAlt1: AppTypography.body1
          .copyWith(color: _darkAppColors.onSurfaceSecondary1),
      h1: AppTypography.h1.copyWith(color: _darkAppColors.onSurfacePrimary));
}

extension AppThemeExtension on ThemeData {
  /// Usage example: Theme.of(context).appColors;
  AppColorsExtension get appColors =>
      extension<AppColorsExtension>() ?? AppTheme._lightAppColors;

  AppTypographyExtension get appTextStyles =>
      extension<AppTypographyExtension>() ?? AppTheme._lightTextStyle;
}

extension ThemeGetter on BuildContext {
  // Usage example: `context.theme`
  ThemeData get theme => Theme.of(this);
}
