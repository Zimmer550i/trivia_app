import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/config/theme/app_theme.dart';
import 'package:quiz_app/core/constants/constants.dart';
import 'package:quiz_app/core/utils/html_entity_transform.dart';
import 'package:quiz_app/features/quiz/domain/entity/question.dart';
import 'package:quiz_app/features/quiz/presentation/provider/status.dart';
import 'package:quiz_app/features/quiz/presentation/widgets/page_change_button.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  late String title;
  late Question question;
  late List<String> choiceList;

  bool? isCorrect;

  bool isInitiated = false;

  String findCategoryById(String? n) {
    if (n == null) return "Random Topic";
    for (var i in CATEGORIES) {
      if (i['id'] == n) {
        return i['name']!;
      }
    }

    return "Random";
  }

  void init(BuildContext context) {
    var obj = Provider.of<Status>(context);

    title = findCategoryById(obj.category);
    question = obj.questions[obj.currentQ];
    choiceList = question.incorrectAnswers
      ..add(question.correctAnswer)
      ..shuffle();
    context.read<Status>().isChecking = false;

    isCorrect = null;
    isInitiated = true;
  }

  void check(BuildContext context) {
    context.read<Status>().changeCheckingStatus(true);
    if (context.read<Status>().currentChoice != null &&
        choiceList[context.read<Status>().currentChoice!] ==
            question.correctAnswer) {
      isCorrect = true;
      context.read<Status>().addScore(10);
    } else {
      isCorrect = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!isInitiated) {
      init(context);
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: AppTheme.titleText,
        ),
        toolbarHeight: DEFAULT_PADDING * 5,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              context.read<Status>().reset();
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.close_rounded,
              size: DEFAULT_PADDING * 2,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(DEFAULT_PADDING),
        child: Column(
          children: [
            //Question
            Expanded(child: Container()),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Quiz: ${context.watch<Status>().currentQ + 1}",
                  style: AppTheme.largeText,
                ),
                Text(
                  "Score: ${context.watch<Status>().score}",
                  style: AppTheme.largeText,
                ),
              ],
            ),
            const Divider(
              thickness: 2,
            ),
            Text(
              htmlEntityTransform(question.question),
              style: AppTheme.largeText,
            ),
        
            Expanded(child: Container()),
            //Options
            for (int i = 0; i < choiceList.length; i++)
              Choices(
                text: htmlEntityTransform(choiceList[i]),
                position: i,
              ),
        
            //Button
            Expanded(child: Container()),
            Button(
              text: context.watch<Status>().isChecking ? "Next" : "Check",
              isColored: context.watch<Status>().isChecking ? true : false,
              callBack: (context) => context.read<Status>().isChecking
                  ? context.read<Status>().nextQuestion(context)
                  : check(context),
            ),
          ],
        ),
      ),
    );
  }
}

class Choices extends StatelessWidget {
  final String text;
  final int position;
  final List<String> options;
  const Choices({super.key, required this.text, required this.position})
      : options = const ["A", "B", "C", "D"];

  bool ifSelected(BuildContext context) {
    return Provider.of<Status>(context).currentChoice == position;
  }

  Color getColor(BuildContext context) {
    bool isChecking = context.watch<Status>().isChecking;
    bool isCorrect = context
            .watch<Status>()
            .questions[context.watch<Status>().currentQ]
            .correctAnswer ==
        text;

    if (isChecking) {
      if (isCorrect) {
        return GREEN_COLOR;
      } else if (position == context.watch<Status>().currentChoice) {
        return RED_COLOR;
      }
    } else if (ifSelected(context)) {
      return PRIMARY_COLOR;
    }

    return WHITE_COLOR;
  }

  @override
  Widget build(BuildContext context) {
    bool isSelected = ifSelected(context);
    Color color = getColor(context);

    return Padding(
      padding: EdgeInsets.symmetric(vertical: DEFAULT_PADDING * 0.3),
      child: GestureDetector(
        onTap: () {
          if (context.read<Status>().isChecking) return;
          if (isSelected) {
            context.read<Status>().changeChoice(null);
          } else {
            context.read<Status>().changeChoice(position);
          }
        },
        child: AnimatedContainer(
          duration: Duration(milliseconds: DEFAULT_ANIMATION_DURATION * 3),
          width: double.infinity,
          height: BASE_WIDGET_HEIGHT,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(BASE_WIDGET_HEIGHT),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                left: BASE_WIDGET_HEIGHT * 1.5,
                child: Text(
                  text,
                  textAlign: TextAlign.left,
                  style: AppTheme.defaultText.copyWith(
                    color: Colors.black,
                  ),
                ),
              ),
              AnimatedPositioned(
                duration:
                    Duration(milliseconds: DEFAULT_ANIMATION_DURATION * 5),
                curve: Curves.bounceOut,
                left: isSelected
                    ? MediaQuery.of(context).size.width -
                        (DEFAULT_PADDING * 2.3) -
                        (BASE_WIDGET_HEIGHT - (DEFAULT_PADDING * 0.6))
                    : DEFAULT_PADDING * 0.3,
                child: AnimatedContainer(
                  duration: Duration(milliseconds: DEFAULT_ANIMATION_DURATION),
                  height: BASE_WIDGET_HEIGHT - (DEFAULT_PADDING * 0.6),
                  width: BASE_WIDGET_HEIGHT - (DEFAULT_PADDING * 0.6),
                  decoration: BoxDecoration(
                    color: isSelected ? WHITE_COLOR : PRIMARY_COLOR,
                    borderRadius: BorderRadius.circular(
                        BASE_WIDGET_HEIGHT - (DEFAULT_PADDING * 0.6)),
                  ),
                  child: Center(
                    child: Text(
                      isSelected ? "✓" : options[position],
                      style: AppTheme.titleText.copyWith(
                          color: isSelected ? PRIMARY_COLOR : WHITE_COLOR),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
