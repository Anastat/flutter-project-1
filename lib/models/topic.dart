class Topic {
  int id;
  String name;
  String questionPath;
  int correctAnswers;

  Topic(
      {required this.id,
      required this.name,
      required this.questionPath,
      this.correctAnswers = 0});

  factory Topic.fromJson(Map<String, dynamic> data) {
    return Topic(
        id: data['id'],
        name: data['name'],
        questionPath: data['question_path']);
  }

  Map<String, dynamic> toJson() =>
      {'id': id, 'name': name, 'questionPath': questionPath};

  @override
  String toString() {
    return 'Topic(id: $id, name: $name, questionPath: $questionPath, correctAnswers: $correctAnswers)';
  }
}
