import 'package:flutter/material.dart';
import 'package:gulf_catalog_app/core/configs/theme/new/app_colors.dart';
import 'package:gulf_catalog_app/core/configs/theme/new/color_scheme.dart';
import 'package:gulf_catalog_app/core/configs/theme/new/navbar_theme.dart';
import 'package:gulf_catalog_app/core/configs/theme/new/text_theme.dart';

class MAppTheme {
  MAppTheme._();

  static final kRadius = BorderRadius.circular(12);

  static ThemeData Function(BuildContext) lightTheme =
      (BuildContext context) => ThemeData(
              useMaterial3: true,
              brightness: Brightness.light,
              fontFamily: 'GreycliffCF',
              scaffoldBackgroundColor: AppColors.background,
              primaryColor: MColorScheme.light.primary,
              colorScheme: MColorScheme.light,
              textTheme: MTextTheme.light,
              textSelectionTheme: TextSelectionThemeData(
                cursorColor: MColorScheme.light.primary,
                selectionHandleColor: MColorScheme.light.primary,
                selectionColor: MColorScheme.light.primary.withOpacity(0.2),
              ),
              elevatedButtonTheme: ElevatedButtonThemeData(
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                  foregroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  side: BorderSide.none,
                  shape: RoundedRectangleBorder(
                    borderRadius: MAppTheme.kRadius,
                  ),
                ),
              ),
              iconButtonTheme: IconButtonThemeData(
                style: IconButton.styleFrom(
                  elevation: 0,
                  padding: const EdgeInsets.all(10),
                  backgroundColor: Colors.transparent,
                ),
              ),
              inputDecorationTheme: InputDecorationTheme(
                contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.zero,
                  borderSide: BorderSide.none,
                ),
                focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.zero,
                  borderSide: BorderSide.none,
                ),
                hintStyle: MTextTheme.light.labelMedium!.copyWith(
                  color: MColorScheme.light.onSurface.withOpacity(0.7),
                ),
              ),
              extensions: [
                MButtonbarTheme.light(context),
              ]);
}
