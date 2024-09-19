import 'package:flutter/material.dart';

class MTextTheme {
  const MTextTheme._();

  static const light = TextTheme(
    displayLarge: TextStyle(
        color: Colors.black, fontSize: 42, fontWeight: FontWeight.w900),
    displayMedium: TextStyle(
        color: Colors.black, fontSize: 38, fontWeight: FontWeight.w900),
    displaySmall: TextStyle(
        color: Colors.black, fontSize: 34, fontWeight: FontWeight.w900),
    //=====================================================================//
    //=====================================================================//
    headlineLarge: TextStyle(
        color: Colors.black, fontSize: 32, fontWeight: FontWeight.w800),
    headlineMedium: TextStyle(
        color: Colors.black, fontSize: 28, fontWeight: FontWeight.w800),
    headlineSmall: TextStyle(
        color: Colors.black, fontSize: 24, fontWeight: FontWeight.w800),
    //=====================================================================//
    //=====================================================================//
    titleLarge: TextStyle(
        color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold),
    titleMedium: TextStyle(
        color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
    titleSmall: TextStyle(
        color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold),
    //=====================================================================//
    //=====================================================================//
    bodyLarge: TextStyle(
        color: Colors.black, fontSize: 14, fontWeight: FontWeight.w400),
    bodyMedium: TextStyle(
        color: Colors.black, fontSize: 13, fontWeight: FontWeight.w400),
    bodySmall: TextStyle(
        color: Colors.black, fontSize: 12, fontWeight: FontWeight.w400),
    //=====================================================================//
    //=====================================================================//
    labelLarge: TextStyle(
        color: Colors.black, fontSize: 14, fontWeight: FontWeight.w600),
    labelMedium: TextStyle(
        color: Colors.black, fontSize: 13, fontWeight: FontWeight.w600),
    labelSmall: TextStyle(
        color: Colors.black, fontSize: 11, fontWeight: FontWeight.w600),
  );
}
