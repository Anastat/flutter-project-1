import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/topic.dart';

class TopicApi {
  final _endpoint = 'https://dad-quiz-api.deno.dev/topics';

  Future<List<Topic>> getTopics() async {
    var response = await http.get(Uri.parse(_endpoint));
    var topics = <Topic>[];

    if (response.body.isNotEmpty) {
      topics = jsonDecode(response.body)
          .map<Topic>((topic) => Topic.fromJson(topic))
          .toList();
    }

    return topics;
  }
}
