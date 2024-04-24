// ignore_for_file: non_constant_identifier_names, constant_identifier_names

import 'package:flutter/material.dart';

double BASE_WIDGET_HEIGHT = 50;
double DEFAULT_PADDING = 16;

const int TOTAL_QUESTION_COUNT = 10;
const String BASE_API_URL = 'opentdb.com';
const List<Map<String, String>> CATEGORIES = [
  {'id': '9', 'name': 'General Knowledge'},
  {'id': '10', 'name': 'Books'},
  {'id': '11', 'name': 'Film'},
  {'id': '12', 'name': 'Music'},
  {'id': '13', 'name': 'Musicals & Theatres'},
  {'id': '14', 'name': 'Television'},
  {'id': '15', 'name': 'Video Games'},
  {'id': '16', 'name': 'Board Games'},
  {'id': '17', 'name': 'Science & Nature'},
  {'id': '18', 'name': 'Computers'},
  {'id': '19', 'name': 'Mathematics'},
  {'id': '20', 'name': 'Mythology'},
  {'id': '21', 'name': 'Sports'},
  {'id': '22', 'name': 'Geography'},
  {'id': '23', 'name': 'History'},
  {'id': '24', 'name': 'Politics'},
  {'id': '25', 'name': 'Art'},
  {'id': '26', 'name': 'Celebrities'},
  {'id': '27', 'name': 'Animals'},
  {'id': '28', 'name': 'Vehicles'},
  {'id': '29', 'name': 'Comics'},
  {'id': '30', 'name': 'Gadgets'},
  {'id': '31', 'name': 'Japanese Anime & Manga'},
  {'id': '32', 'name': 'Cartoon & Animations'},
];

const Color BACKGROUND_COLOR = Color.fromARGB(255, 30, 45, 65);
const Color PRIMARY_COLOR = Color.fromARGB(255, 230, 130, 50);
const Color SECONDARY_COLOR = Color.fromARGB(255, 45, 65, 90);
const Color WHITE_COLOR = Color.fromARGB(255, 200, 220, 230);