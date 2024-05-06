import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:quiz_app/features/quiz/presentation/pages/homepage.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      const Duration(seconds: 3),
      () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => const HomePage(),
        ),
      ),
    );

    return Scaffold(
      body: Center(
        child: Hero(
          tag: "logo",
          child: Lottie.asset("assets/splash.json"),
        ),
      ),
    );
  }
}
