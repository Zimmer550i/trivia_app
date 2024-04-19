import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/config/theme/app_theme.dart';
import 'package:quiz_app/features/quiz/presentation/pages/homepage.dart';
import 'package:quiz_app/features/quiz/presentation/provider/status.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => Status()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.darkTheme,
      home: const HomePage(),
    );
  }
}
