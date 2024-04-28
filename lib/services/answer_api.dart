import 'package:http/http.dart' as http;
import 'dart:convert';

class AnswerApi {
  final _endpoint = 'https://dad-quiz-api.deno.dev';

  Future<bool> postAnswer(int topicId, int questionId, String answer) async {
    var response = await http.post(
      Uri.parse('$_endpoint/topics/$topicId/questions/$questionId/answers'),
      body: jsonEncode({'answer': answer}),
    );

    var data = jsonDecode(response.body);
    return data['correct'];
  }
}
