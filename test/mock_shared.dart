import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

// Function to set up mock SharedPreferences
Future<void> setupMockSharedPreferences() async {
  SharedPreferences.setMockInitialValues({
    "statistics": jsonEncode([
      {
        "id": 1,
        "name": "Basic arithmetics",
        "question_path": "/topics/1/questions",
        "correctAnswers": 0
      },
      {
        "id": 2,
        "name": "Countries and capitals",
        "question_path": "/topics/2/questions",
        "correctAnswers": 0
      },
      {
        "id": 3,
        "name": "Countries and continents",
        "question_path": "/topics/3/questions",
        "correctAnswers": 0
      },
      {
        "id": 4,
        "name": "Dog breeds",
        "question_path": "/topics/4/questions",
        "correctAnswers": 0
      }
    ]),
  });
}
