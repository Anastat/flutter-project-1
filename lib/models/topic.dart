class Topic {
  int id;
  String name;
  String questionPath;
  int correctAnswers = 0;

  Topic({required this.id, required this.name, required this.questionPath});

  factory Topic.fromJson(Map<String, dynamic> data) {
    return Topic(
        id: data['id'],
        name: data['name'],
        questionPath: data['question_path']);
  }
}
