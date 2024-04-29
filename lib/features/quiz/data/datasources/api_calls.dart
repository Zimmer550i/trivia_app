import 'dart:convert';

import 'package:quiz_app/core/constants/constants.dart';
import 'package:http/http.dart' as http;

class ApiCalls {
  static Future<List<Map<String, dynamic>>?> fetchQuestions(
      {String? category, String? difficulty}) async {
    Map<String, dynamic> query = {'amount': "10", "type": "multiple"};

    if (category != null) {
      query.addAll({'category': category});
    }

    if (difficulty != null) {
      query.addAll({'difficulty': difficulty});
    }

    var url = Uri.https(BASE_API_URL, '/api.php', query);

    var response = await http.get(url);

    if (response.statusCode == 200) {
      return List<Map<String, dynamic>>.from(
          json.decode(response.body)['results']);
    } else {
      return null;
    }
  }
}
