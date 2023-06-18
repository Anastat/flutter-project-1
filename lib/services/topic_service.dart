import 'package:http/http.dart' as http;
import 'dart:convert';

class TopicsService {
  final _endpoint = 'https://dad-quiz-api.deno.dev/topics';

  Future<List<Topic>> getTopics() async {
    var response = await http.get(Uri.parse(_endpoint));

    return jsonDecode(response.body)
        .map<Topic>((topic) => Topic.fromJson(topic))
        .toList();
  }
}

class Topic {
  int id;
  String name;
  String questionPath;

  Topic({required this.id, required this.name, required this.questionPath});

  factory Topic.fromJson(Map<String, dynamic> data) {
    return Topic(
        id: data['id'],
        name: data['name'],
        questionPath: data['question_path']);
  }
}
