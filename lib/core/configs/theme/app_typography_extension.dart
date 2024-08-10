import 'package:flutter/material.dart';

class AppTypographyExtension extends ThemeExtension<AppTypographyExtension> {
  final TextStyle body1;
  final TextStyle bodyAlt1;
  final TextStyle h1;

  AppTypographyExtension(
      {required this.body1, required this.bodyAlt1, required this.h1});

  @override
  ThemeExtension<AppTypographyExtension> copyWith({
    TextStyle? body1,
    TextStyle? bodyAlt1,
    TextStyle? h1,
  }) {
    return AppTypographyExtension(
      body1: body1 ?? this.body1,
      bodyAlt1: bodyAlt1 ?? this.bodyAlt1,
      h1: h1 ?? this.h1,
    );
  }

  @override
  ThemeExtension<AppTypographyExtension> lerp(
      covariant ThemeExtension<AppTypographyExtension>? other, double t) {
    if (other is! AppTypographyExtension) {
      return this;
    }

    return AppTypographyExtension(
      body1: TextStyle.lerp(body1, other.body1, t)!,
      bodyAlt1: TextStyle.lerp(bodyAlt1, other.bodyAlt1, t)!,
      h1: TextStyle.lerp(h1, other.h1, t)!,
    );
  }
}
