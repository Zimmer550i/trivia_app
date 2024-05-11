import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/core/constants/constants.dart';

class AppTheme{
  static ThemeData darkTheme = ThemeData.dark(useMaterial3: false).copyWith(
    scaffoldBackgroundColor: BACKGROUND_COLOR,
    appBarTheme: const AppBarTheme(color: SECONDARY_COLOR),
  );

  static TextStyle defaultText  = GoogleFonts.encodeSansCondensed(color: Colors.black, fontSize: DEFAULT_PADDING);
  static TextStyle titleText  = GoogleFonts.juliusSansOne(color: WHITE_COLOR, fontSize: DEFAULT_PADDING*1.5);
  static TextStyle largeText  = GoogleFonts.encodeSansCondensed(color: WHITE_COLOR, fontSize: DEFAULT_PADDING*2);
  static BoxShadow boxShadow = BoxShadow(offset: const Offset(0, 2), spreadRadius: 2, blurRadius: 5, color: Colors.black87.withAlpha(100));
}