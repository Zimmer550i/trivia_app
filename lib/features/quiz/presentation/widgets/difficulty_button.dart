import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/config/theme/app_theme.dart';
import 'package:quiz_app/core/constants/constants.dart';
import 'package:quiz_app/features/quiz/presentation/provider/status.dart';

class DifficultyButton extends StatelessWidget {
  const DifficultyButton({super.key});

  @override
  Widget build(BuildContext context) {
    int diff = context.watch<Status>().difficulty;
    double w = MediaQuery.of(context).size.width - (DEFAULT_PADDING * 3);
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(DEFAULT_PADDING / 2),
      decoration: BoxDecoration(
        color: WHITE_COLOR,
        borderRadius: BorderRadius.circular(DEFAULT_PADDING / 2.5),
        boxShadow: [AppTheme.boxShadow],
      ),
      child: Stack(
        children: [
          AnimatedPositioned(
            duration: Duration(
              milliseconds: DEFAULT_ANIMTATION_DURATION,
            ),
            left: diff * w / 3,
            child: Container(
              width: w / 3,
              height: BASE_WIDGET_HEIGHT,
              decoration: BoxDecoration(
                color: PRIMARY_COLOR,
                borderRadius: BorderRadius.circular(DEFAULT_PADDING / 3),
                boxShadow: [AppTheme.boxShadow],
              ),
            ),
          ),
          Row(
            children: [
              segment("Easy", 0, context),
              segment("Medium", 1, context),
              segment("Hard", 2, context),
            ],
          ),
        ],
      ),
    );
  }

  Expanded segment(String text, int index, BuildContext context) {
    bool isSelected = context.watch<Status>().difficulty == index;
    return Expanded(
      child: InkWell(
        onTap: () {
          context.read<Status>().changeDifficulty(index);
        },
        child: SizedBox(
          height: BASE_WIDGET_HEIGHT,
          child: Center(
            child: Text(
              text,
              style: AppTheme.defaultText.copyWith(
                  fontWeight: FontWeight.bold,
                  color: isSelected ? WHITE_COLOR : Colors.black87),
            ),
          ),
        ),
      ),
    );
  }
}
