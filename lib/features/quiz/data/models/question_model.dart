import 'package:quiz_app/features/quiz/domain/entity/question.dart';

class QuestionModel extends Question {
  QuestionModel(
      {required super.category,
      required super.type,
      required super.difficulty,
      required super.question,
      required super.correctAnswer,
      required super.incorrectAnswers});

  factory QuestionModel.fromJson(Map<String, dynamic> map){
    return QuestionModel(
      category: map['category'],
      type: map['type'],
      difficulty: map['difficulty'],
      question: map['question'],
      correctAnswer: map['correct_answer'],
      incorrectAnswers: List<String>.from(map['incorrect_answers']),
    );
  }
}
