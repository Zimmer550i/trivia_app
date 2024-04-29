import 'package:flutter/material.dart';
import 'package:quiz_app/core/utils/check_internet_connection.dart';
import 'package:quiz_app/features/quiz/domain/entity/question.dart';
import 'package:quiz_app/features/quiz/domain/usecases/get_questions.dart';

class Status extends ChangeNotifier {
  bool isPlaying = false;
  int totalQCount = 10;
  int currentQ = 0;
  int score = 0;
  int difficulty = 0;
  String? category;
  bool isLoading = false;
  List<Question> questions = [];

  int get getScore => score;

  void changeDifficulty(int n) {
    difficulty = n;
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
