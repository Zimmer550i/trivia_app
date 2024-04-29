import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/config/theme/app_theme.dart';
import 'package:quiz_app/core/constants/constants.dart';
import 'package:quiz_app/features/quiz/presentation/provider/status.dart';

class Button extends StatelessWidget {
  final bool isColored;
  final String text;
  final Function(BuildContext)? callBack;
  const Button(
      {super.key, this.isColored = false, required this.text, this.callBack});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: DEFAULT_PADDING),
      child: GestureDetector(
        onTap: () {
          if (callBack != null) {
            callBack!(context);
          } else {
          }
        },
        child: Container(
          height: BASE_WIDGET_HEIGHT,
          decoration: BoxDecoration(
            color: isColored ? PRIMARY_COLOR : WHITE_COLOR,
            borderRadius: BorderRadius.circular(DEFAULT_PADDING),
          ),
          child: Center(
            child: Provider.of<Status>(context).isLoading
                ? const CircularProgressIndicator()
                : Text(
                    text,
                    style: AppTheme.titleText.copyWith(
                        color: isColored ? WHITE_COLOR : SECONDARY_COLOR,
                        fontWeight: FontWeight.bold),
                  ),
          ),
        ),
      ),
    );
  }
}
