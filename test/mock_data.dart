import 'dart:convert';

import 'package:nock/nock.dart';
import 'package:shared_preferences/shared_preferences.dart';

void setupNock() {
  nock.defaultBase = "https://dad-quiz-api.deno.dev";
  nock.init();
  // Mock get to topics API
  nock.get("/topics").reply(200, [
    {
      "id": 1,
      "name": "Basic arithmetics",
      "question_path": "/topics/1/questions"
    },
    {
      "id": 2,
      "name": "Countries and capitals",
      "question_path": "/topics/2/questions"
    },
    {
      "id": 3,
      "name": "Countries and continents",
      "question_path": "/topics/3/questions"
    },
    {"id": 4, "name": "Dog breeds", "question_path": "/topics/4/questions"}
  ]);
  // Mock GET response to question of topic 1
  nock.get("/topics/1/questions").reply(200, {
    "id": 5,
    "question": "What is the outcome of 50 + 50?",
    "options": ["100", "20", "8", "200"],
    "answer_post_path": "/topics/1/questions/5/answers"
  });
  // Mock POST to response to answer on mocked question to topic 1
  nock.post('/topics/1/questions/5/answers', json.encode({"answer": "100"}))
    ..reply(
      200,
      {'correct': true},
    );

  nock.post('/topics/1/questions/5/answers', json.encode({"answer": "20"}))
    ..reply(
      200,
      {'correct': false},
    );
}
