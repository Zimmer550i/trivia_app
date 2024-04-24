import 'package:flutter/material.dart';
import 'package:quiz_app/core/constants/constants.dart';

class AppTheme{
  static ThemeData darkTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: BACKGROUND_COLOR,
    appBarTheme: const AppBarTheme(color: SECONDARY_COLOR),
  );

  static TextStyle blackText  = const TextStyle(color: Colors.black87);

  static BoxShadow boxShadow = BoxShadow(offset: Offset(0, 2), spreadRadius: 1, blurRadius: 5, color: Colors.black87.withAlpha(100));
}