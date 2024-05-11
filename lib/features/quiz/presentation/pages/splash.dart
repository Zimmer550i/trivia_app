import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:quiz_app/config/theme/app_theme.dart';
import 'package:quiz_app/core/constants/constants.dart';
import 'package:quiz_app/features/quiz/presentation/pages/homepage.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    const int sec = 3;
    DEFAULT_PADDING = MediaQuery.of(context).size.height / 50;

    Future.delayed(
      const Duration(seconds: sec),
      () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => const HomePage(),
        ),
      ),
    );

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: EdgeInsets.all(DEFAULT_PADDING * 3),
              child: Lottie.asset("assets/splash.json"),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: DEFAULT_PADDING * 3),
              child: FittedBox(
                fit: BoxFit.cover,
                child: Text(
                  "Trivia Quiz",
                  style: GoogleFonts.lilitaOne(
                      shadows: [AppTheme.boxShadow], color: WHITE_COLOR),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
