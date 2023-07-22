import 'package:http/http.dart' as http;
import 'dart:convert';

class QuestionService {
  final _endpoint = 'https://dad-quiz-api.deno.dev';

  Future<Question> getQuestion(int topicId) async {
    var response =
        await http.get(Uri.parse('$_endpoint/topics/$topicId/questions'));
    var data = jsonDecode(response.body);

    return Question(data['question'], data['image_url'], data['options'],
        data['answer_post_path']);
  }
}

class Question {
  String question;
  String? imageUrl;
  List<dynamic> options;
  String answerPostPath;

  Question(this.question, this.imageUrl, this.options, this.answerPostPath);
}
