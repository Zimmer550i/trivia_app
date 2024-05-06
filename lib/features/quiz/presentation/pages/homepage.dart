import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/config/theme/app_theme.dart';
import 'package:quiz_app/core/constants/constants.dart';
import 'package:quiz_app/features/quiz/presentation/pages/quiz_page.dart';
import 'package:quiz_app/features/quiz/presentation/provider/status.dart';
import 'package:quiz_app/features/quiz/presentation/widgets/difficulty_button.dart';
import 'package:quiz_app/features/quiz/presentation/widgets/page_change_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void fetchQuiz(BuildContext context) async {
    var status = Provider.of<Status>(context, listen: false);
    String? category = status.category;
    String? difficulty = status.difficulty == 0
        ? "easy"
        : status.difficulty == 1
            ? "medium"
            : "hard";
    status
        .getQuestions(category, difficulty)
        .then(
          (value) => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const QuizPage(),
            ),
          ),
        )
        .then((value) => context.read<Status>().isPlaying = true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Quiz App",
          style: AppTheme.appName,
        ),
        centerTitle: true,
        leading: Hero(
          tag: "logo",
          child: Lottie.asset("assets/splash.json"),
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          bottomLeft: Radius.elliptical(3 * DEFAULT_PADDING, DEFAULT_PADDING),
          bottomRight: Radius.elliptical(3 * DEFAULT_PADDING, DEFAULT_PADDING),
        )),
        toolbarHeight: 120,
        elevation: 5,
        actions: [
          Center(
            child: Icon(
              Icons.account_circle_rounded,
              size: DEFAULT_PADDING * 2,
            ),
          ),
          SizedBox(
            width: DEFAULT_PADDING,
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(
          right: DEFAULT_PADDING,
          left: DEFAULT_PADDING,
          top: DEFAULT_PADDING * 2,
        ),
        child: Column(
          children: [
            const DifficultyButton(),
            SizedBox(
              height: DEFAULT_PADDING,
            ),
            Expanded(
              child: ListView(
                children:
                    CATEGORIES.map((map) => topicNames(context, map)).toList(),
              ),
            ),
            Button(
              text: "Begin",
              callBack: (context) => fetchQuiz(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget topicNames(BuildContext context, Map<String, String> item) {
    bool isSelected = context.watch<Status>().category == item['id'];
    return Padding(
      padding: EdgeInsets.symmetric(vertical: DEFAULT_PADDING / 3),
      child: InkWell(
        onTap: () {
          context.read<Status>().changeCategory(item['id']!);
        },
        child: AnimatedContainer(
          duration: Duration(milliseconds: DEFAULT_ANIMATION_DURATION),
          height: BASE_WIDGET_HEIGHT,
          decoration: BoxDecoration(
            color: isSelected ? PRIMARY_COLOR : SECONDARY_COLOR,
            borderRadius: BorderRadius.circular(DEFAULT_PADDING / 2),
            boxShadow: [AppTheme.boxShadow],
          ),
          child: Center(
              child: Text(
            item['name']!,
            style: AppTheme.largeText,
          )),
        ),
      ),
    );
  }
}
