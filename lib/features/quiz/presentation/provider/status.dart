import 'package:flutter/material.dart';
import 'package:quiz_app/features/quiz/domain/entity/question.dart';

class Status extends ChangeNotifier{
  bool isPlaying = false;
  int totalQCount = 10;
  int currentQ = 0;
  int score = 0;
  List<Question> questions = [];

  int get getScore => score;

  void startGame(){
    isPlaying = true;
    currentQ = 0;
    score = 0;
    notifyListeners();
  }

  void endGame(){
    isPlaying = false;
    notifyListeners();
  }

  void getQuestions(List<Question> q){
    questions = q;
    notifyListeners();
  }
}