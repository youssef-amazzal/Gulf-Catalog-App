import 'package:flutter/material.dart';

abstract class AppTypography {
  static const String _fontFamily = 'GreycliffCF';

  static const body1 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    fontFamily: _fontFamily,
    decoration: TextDecoration.none,
  );

  static const h1 = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.w700,
    fontFamily: _fontFamily,
    decoration: TextDecoration.none,
  );
}
