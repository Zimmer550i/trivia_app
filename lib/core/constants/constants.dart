import 'package:flutter/material.dart';

const int TOTAL_QUESTION_COUNT = 10;
const String BASE_API_URL = 'opentdb.com';
const List<Map<String, String>> CATEGORIES = [
  {'id': '9', 'name': 'General Knowledge'},
  {'id': '10', 'name': 'Entertainment: Books'},
  {'id': '11', 'name': 'Entertainment: Film'},
  {'id': '12', 'name': 'Entertainment: Music'},
  {'id': '13', 'name': 'Entertainment: Musicals & Theatres'},
  {'id': '14', 'name': 'Entertainment: Television'},
  {'id': '15', 'name': 'Entertainment: Video Games'},
  {'id': '16', 'name': 'Entertainment: Board Games'},
  {'id': '17', 'name': 'Science & Nature'},
  {'id': '18', 'name': 'Science: Computers'},
  {'id': '19', 'name': 'Science: Mathematics'},
  {'id': '20', 'name': 'Mythology'},
  {'id': '21', 'name': 'Sports'},
  {'id': '22', 'name': 'Geography'},
  {'id': '23', 'name': 'History'},
  {'id': '24', 'name': 'Politics'},
  {'id': '25', 'name': 'Art'},
  {'id': '26', 'name': 'Celebrities'},
  {'id': '27', 'name': 'Animals'},
  {'id': '28', 'name': 'Vehicles'},
  {'id': '29', 'name': 'Entertainment: Comics'},
  {'id': '30', 'name': 'Science: Gadgets'},
  {'id': '31', 'name': 'Entertainment: Japanese Anime & Manga'},
  {'id': '32', 'name': 'Entertainment: Cartoon & Animations'},
];

const Color BACKGROUND_COLOR = Color.fromARGB(255, 30, 45, 65);
const Color PRIMARY_COLOR = Color.fromARGB(255, 230, 130, 50);
const Color SECONDARY_COLOR = Color.fromARGB(255, 45, 65, 90);
const Color WHITE_COLOR = Color.fromARGB(255, 200, 220, 230);