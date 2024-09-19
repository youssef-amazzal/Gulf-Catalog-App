import 'package:flutter/material.dart';
import 'package:gulf_catalog_app/core/configs/theme/new/app_colors.dart';

class MColorScheme {
  const MColorScheme._();

  static ColorScheme light = ColorScheme.light(
    brightness: Brightness.light,
    primary: AppColors.red,
    secondary: AppColors.blue,
    error: AppColors.red.withOpacity(0.1),
    onError: AppColors.red,
    surface: AppColors.white_0,
    surfaceDim: AppColors.white_1,
    inverseSurface: AppColors.black_0,
    surfaceBright: AppColors.black_1,
    onPrimary: AppColors.tWhite,
    onSecondary: AppColors.tWhite,
    onSurface: AppColors.tBlack,
    onSurfaceVariant: AppColors.tGrey,
    onInverseSurface: AppColors.tInverseGrey,
    outline: AppColors.grey,
  );
}
