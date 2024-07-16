import 'package:flutter_test/flutter_test.dart';
import 'package:nock/nock.dart';
import 'package:project_1/services/answer_api.dart';
import 'dart:convert';

void main() {
  setUpAll(() {
    nock.init();
  });

  setUp(() {
    nock.cleanAll();
  });

  test('POST request to submit an answer', () async {
    // Mock the POST request
    final interceptor = nock('https://dad-quiz-api.deno.dev')
        .post('/topics/1/questions/5/answers', json.encode({"answer": "100"}))
      ..reply(
        200,
        {'correct': true},
      );

    // Make the POST request
    final api = AnswerApi();
    final result = await api.postAnswer(1, 5, '100');

    // Verify the result
    expect(interceptor.isDone, true);
    expect(result, true);
  });
}
