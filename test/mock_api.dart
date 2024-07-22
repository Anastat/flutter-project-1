import 'dart:convert';

import 'package:nock/nock.dart';

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

  // Mock GET response to question of topics
  nock.get("/topics/1/questions").reply(200, {
    "id": 5,
    "question": "What is the outcome of 50 + 50?",
    "options": ["100", "20", "8", "200"],
    "answer_post_path": "/topics/1/questions/5/answers"
  });
  nock.get("/topics/2/questions").reply(200, {
    "id": 1,
    "question": "What is the capital of Afghanistan?",
    "options": ["Kabul", "Yerevan", "Canberra", "St. John's", "Algiers"],
    "answer_post_path": "/topics/2/questions/1/answers"
  });
  nock.get("/topics/3/questions").reply(200, {
    "id": 7,
    "question": "In what continent is Argentina located?",
    "options": ["Asia", "America", "Europe", "Africa"],
    "answer_post_path": "/topics/3/questions/7/answers"
  });
  nock.get("/topics/4/questions").reply(200, {
    "id": 1,
    "question": "What sort of a dog is this?",
    "options": ["Labracadabrador", "Keeshond", "Samoyed", "Pomeranian"],
    "answer_post_path": "/topics/4/questions/1/answers",
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
