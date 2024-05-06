import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/config/theme/app_theme.dart';
import 'package:quiz_app/core/constants/constants.dart';
import 'package:quiz_app/features/quiz/presentation/provider/status.dart';
import 'package:quiz_app/features/quiz/presentation/widgets/page_change_button.dart';

class Result extends StatelessWidget {
  const Result({super.key});

  @override
  Widget build(BuildContext context) {
    int totalQCount = context.read<Status>().totalQCount;
    int score = context.read<Status>().getScore;

    return Scaffold(
      body: Column(
        children: [
          Expanded(child: Container()),
          Padding(
            padding: EdgeInsets.all(DEFAULT_PADDING),
            child: Container(
              width: double.infinity,
              constraints: const BoxConstraints(minHeight: 200),
              decoration: BoxDecoration(
                color: WHITE_COLOR,
                borderRadius: BorderRadius.circular(DEFAULT_PADDING * 2),
              ),
              padding: EdgeInsets.all(DEFAULT_PADDING * 2),
              child: Column(
                children: [
                  Lottie.asset("assets/congrats.json",
                      width: MediaQuery.of(context).size.width / 2),
                  Text(
                    "Congrats!",
                    style: AppTheme.largeText.copyWith(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: DEFAULT_PADDING,
                  ),
                  Text(
                    "$score% Score",
                    style: AppTheme.largeText.copyWith(
                      color: GREEN_COLOR,
                      fontSize: DEFAULT_PADDING * 3,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: DEFAULT_PADDING,
                  ),
                  Text(
                    "Quiz Completed Successfully.",
                    style: AppTheme.defaultText.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: DEFAULT_PADDING,
                  ),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: AppTheme.defaultText,
                      children: [
                        const TextSpan(
                          text: "You have attempted ",
                        ),
                        TextSpan(
                          text: "$totalQCount questions ",
                          style: const TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const TextSpan(
                          text: "and from that ",
                        ),
                        TextSpan(
                          text: "${score ~/ totalQCount} questions ",
                          style: const TextStyle(
                            color: GREEN_COLOR,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const TextSpan(
                          text: "is correct.",
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: DEFAULT_PADDING,
                  ),
                ],
              ),
            ),
          ),
          Expanded(child: Container()),
          Padding(
            padding: EdgeInsets.all(DEFAULT_PADDING),
            child: Button(
              text: "Home",
              isColored: true,
              callBack: (p0) {
                Navigator.of(context).pop();
              },
            ),
          ),
        ],
      ),
    );
  }
}
