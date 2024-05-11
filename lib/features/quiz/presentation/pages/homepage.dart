import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/config/theme/app_theme.dart';
import 'package:quiz_app/core/constants/constants.dart';
import 'package:quiz_app/core/utils/show_snackbar.dart';
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
          (value) => !status.isLoading ? Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const QuizPage(),
            ),
          ): Future.delayed(Duration.zero),
        )
        .onError((error, stackTrace) => showSnackBar(context, error.toString()))
        .then((value) => context.read<Status>().changeIsLoading(false));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Trivia App",
          style: GoogleFonts.juliusSansOne(
              shadows: [AppTheme.boxShadow],
              color: WHITE_COLOR,
              fontSize: DEFAULT_PADDING * 3),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft:
                Radius.elliptical(5 * DEFAULT_PADDING, DEFAULT_PADDING * 1.3),
            bottomRight:
                Radius.elliptical(5 * DEFAULT_PADDING, DEFAULT_PADDING * 1.3),
          ),
        ),
        toolbarHeight: DEFAULT_PADDING * 7,
        elevation: 5,
      ),
      body: Padding(
        padding: EdgeInsets.only(
          top: DEFAULT_PADDING * 2,
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: DEFAULT_PADDING),
              child: const DifficultyButton(),
            ),
            Expanded(
              child: ListView(
                clipBehavior: Clip.antiAlias,
                physics: const BouncingScrollPhysics(
                    decelerationRate: ScrollDecelerationRate.fast),
                children: [
                  SizedBox(
                    height: DEFAULT_PADDING,
                  ),
                  ...CATEGORIES.map((map) => topicNames(context, map)),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: DEFAULT_PADDING),
              child: Button(
                text: "Begin",
                callBack: (context) => fetchQuiz(context),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget topicNames(BuildContext context, Map<String, String> item) {
    bool isSelected = context.watch<Status>().category == item['id'];
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: DEFAULT_PADDING / 3, horizontal: DEFAULT_PADDING),
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
