import 'package:flutter/material.dart';
import 'package:quiz_app/core/utils/check_internet_connection.dart';
import 'package:quiz_app/features/quiz/domain/entity/question.dart';
import 'package:quiz_app/features/quiz/domain/usecases/get_questions.dart';
import 'package:quiz_app/features/quiz/presentation/pages/quiz_page.dart';
import 'package:quiz_app/features/quiz/presentation/pages/result_page.dart';

class Status extends ChangeNotifier {
  bool isPlaying = false;
  int totalQCount = 10;
  int currentQ = 0;
  int? currentChoice;
  int score = 0;
  bool isChecking = false;
  int difficulty = 0;
  String? category;
  bool isLoading = false;
  List<Question> questions = [];

  int get getScore => score;

  void nextQuestion(BuildContext context) {
    currentQ += 1;
    currentChoice = null;

    if (currentQ < totalQCount) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) => const QuizPage(),
        ),
      );
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) => const Result(),
        ),
      );
    }
  }

  void addScore(int n) {
    score += n;
    notifyListeners();
  }

  void changeCheckingStatus(bool s) {
    isChecking = s;
    notifyListeners();
  }

  void reset() {
    currentQ = 0;
    score = 0;
    isChecking = false;
    isLoading = false;
    difficulty = 0;
    isPlaying = false;
    currentChoice = null;
    category = null;
    notifyListeners();
  }

  void changeDifficulty(int n) {
    difficulty = n;
    notifyListeners();
  }

  void changeChoice(int? n) {
    currentChoice = n;
    notifyListeners();
  }

  Future<bool> getQuestions(String? category, String? difficulty) async {
    if (await hasInternetConnection()) {
      isLoading = true;
      notifyListeners();

      questions =
          await GetQuestions().call(category: category, difficulty: difficulty);

      isLoading = false;
      notifyListeners();
      return true;
    } else {
      notifyListeners();
      return false;
    }
  }

  void changeCategory(String id) {
    category = id;
    notifyListeners();
  }
}
