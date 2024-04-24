import 'package:flutter/material.dart';
import 'package:quiz_app/features/quiz/domain/entity/question.dart';

class Status extends ChangeNotifier{
  bool isPlaying = false;
  int totalQCount = 10;
  int currentQ = 0;
  int score = 0;
  int difficulty = 0;
  String category = "0";
  List<Question> questions = [];

  int get getScore => score;

  void changeDifficulty(int n){
    difficulty = n;
    notifyListeners();
  }

  void getQuestions(List<Question> q){
    questions = q;
    notifyListeners();
  }

  void changeCategory(String id){
    category = id;
    notifyListeners();
  }
}