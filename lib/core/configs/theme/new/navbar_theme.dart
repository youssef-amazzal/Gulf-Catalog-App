// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:gulf_catalog_app/core/configs/theme/new/app_theme.dart';
import 'package:gulf_catalog_app/core/configs/theme/new/color_scheme.dart';
import 'package:gulf_catalog_app/core/configs/theme/new/text_theme.dart';
import 'package:gulf_catalog_app/core/extensions/responsive/responsive.dart';

class MButtonbarTheme {
  const MButtonbarTheme._();

  static ButtonbarTheme Function(BuildContext context) light =
      (BuildContext context) => ButtonbarTheme(
            panelDecoration: BoxDecoration(
              color: context.responsive(MColorScheme.light.inverseSurface,
                  lg: MColorScheme.light.surface),
              borderRadius: MAppTheme.kRadius,
            ),
            buttonDecoration: context.responsive(
              const BoxDecoration(
                shape: BoxShape.rectangle,
              ),
              lg: BoxDecoration(
                borderRadius: MAppTheme.kRadius,
              ),
            ),
            direction: context.responsive(Axis.horizontal),
            buttonHeight:
                context.responsive<double>(25, sm: 30, md: 40, lg: 20, xl: 25),
            spacing: context.responsive<double>(20, sm: 25, lg: 5),
            padding: context.responsive(
              EdgeInsets.all(context.responsive<double>(5, sm: 7, md: 8)),
              lg: const EdgeInsets.all(2.5),
            ),
            buttonPadding: context.responsive(
              EdgeInsets.all(context.responsive(10, md: 13)),
              lg: const EdgeInsets.symmetric(vertical: 10, horizontal: 13),
            ),
            textStyle: MTextTheme.light.labelMedium!.copyWith(
              color: MColorScheme.light.onSurface,
            ),
          );
}

class ButtonbarTheme extends ThemeExtension<ButtonbarTheme> {
  final BoxDecoration panelDecoration;
  final BoxDecoration buttonDecoration;
  final Axis direction;
  final double buttonHeight;
  final double spacing;
  final EdgeInsets padding;
  final EdgeInsets buttonPadding;
  final TextStyle textStyle;

  ButtonbarTheme({
    required this.panelDecoration,
    required this.buttonDecoration,
    required this.direction,
    required this.buttonHeight,
    required this.spacing,
    required this.padding,
    required this.buttonPadding,
    required this.textStyle,
  });

  @override
  ThemeExtension<ButtonbarTheme> lerp(
    covariant ThemeExtension<ButtonbarTheme>? other,
    double t,
  ) {
    if (other is! ButtonbarTheme) return this;

    return ButtonbarTheme(
      panelDecoration:
          BoxDecoration.lerp(panelDecoration, other.panelDecoration, t)!,
      buttonDecoration:
          BoxDecoration.lerp(buttonDecoration, other.buttonDecoration, t)!,
      direction: t < 0.5 ? direction : other.direction,
      buttonHeight: lerpDouble(buttonHeight, other.buttonHeight, t)!,
      spacing: lerpDouble(spacing, other.spacing, t)!,
      padding: EdgeInsets.lerp(padding, other.padding, t)!,
      buttonPadding: EdgeInsets.lerp(buttonPadding, other.buttonPadding, t)!,
      textStyle: TextStyle.lerp(textStyle, other.textStyle, t)!,
    );
  }

  @override
  ButtonbarTheme copyWith({
    BoxDecoration? panelDecoration,
    BoxDecoration? buttonDecoration,
    Axis? direction,
    double? buttonHeight,
    double? spacing,
    EdgeInsets? padding,
    EdgeInsets? buttonPadding,
    TextStyle? textStyle,
  }) {
    return ButtonbarTheme(
      panelDecoration: panelDecoration ?? this.panelDecoration,
      buttonDecoration: buttonDecoration ?? this.buttonDecoration,
      direction: direction ?? this.direction,
      buttonHeight: buttonHeight ?? this.buttonHeight,
      spacing: spacing ?? this.spacing,
      padding: padding ?? this.padding,
      buttonPadding: buttonPadding ?? this.buttonPadding,
      textStyle: textStyle ?? this.textStyle,
    );
  }
}
