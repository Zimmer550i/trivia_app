import 'package:quiz_app/features/quiz/data/datasources/api_calls.dart';
import 'package:quiz_app/features/quiz/data/models/question_model.dart';

class GetQuestions {
  Future<List<QuestionModel>> call(
      {String? category, String? difficulty}) async {
    List<QuestionModel> rtn = [];
    var result = await ApiCalls.fetchQuestions(
        category: category, difficulty: difficulty);
    if (result == null) {
      throw Exception("Could not fetch data from cloud.");
    } else if (result.isEmpty) {
      throw Exception("Error retrieving questions.");
    } else {
      for (var i in result) {
        rtn.add(QuestionModel.fromJson(i));
      }
      return rtn;
    }
  }
}
