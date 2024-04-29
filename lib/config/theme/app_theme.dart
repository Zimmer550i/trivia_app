import 'package:flutter/material.dart';
import 'package:quiz_app/core/constants/constants.dart';

class AppTheme{
  static ThemeData darkTheme = ThemeData.dark(useMaterial3: false).copyWith(
    scaffoldBackgroundColor: BACKGROUND_COLOR,
    appBarTheme: const AppBarTheme(color: SECONDARY_COLOR),
  );

  static TextStyle defaultText  = TextStyle(color: WHITE_COLOR, fontSize: DEFAULT_PADDING);
  static TextStyle titleText  = TextStyle(color: WHITE_COLOR, fontSize: DEFAULT_PADDING*1.5);
  static TextStyle largeText  = TextStyle(color: WHITE_COLOR, fontSize: DEFAULT_PADDING*2);
  static TextStyle appName  = TextStyle(color: WHITE_COLOR, fontSize: DEFAULT_PADDING*2, shadows: [Shadow(offset: const Offset(0, 4), blurRadius: 5, color: Colors.black87.withAlpha(100))]);

  static BoxShadow boxShadow = BoxShadow(offset: const Offset(0, 2), spreadRadius: 1, blurRadius: 5, color: Colors.black87.withAlpha(100));
}