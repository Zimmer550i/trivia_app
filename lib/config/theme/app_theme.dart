import 'package:flutter/material.dart';
import 'package:quiz_app/core/constants/constants.dart';

class AppTheme{
  static ThemeData darkTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: BACKGROUND_COLOR,
    appBarTheme: const AppBarTheme(color: SECONDARY_COLOR),
  );
}