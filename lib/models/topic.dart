class Topic {
  int id;
  String name;
  String questionPath;
  int correctAnswers;

  Topic(
      {required this.id,
      required this.name,
      required this.questionPath,
      required this.correctAnswers});

  factory Topic.fromJson(Map<String, dynamic> data) {
    return Topic(
        id: data['id'],
        name: data['name'],
        questionPath: data['question_path'],
        correctAnswers: 0);
  }

  Topic copyWith(
      {int? id, String? name, String? questionPath, int? correctAnswers}) {
    return Topic(
      id: id ?? this.id,
      name: name ?? this.name,
      questionPath: questionPath ?? this.questionPath,
      correctAnswers: correctAnswers ?? this.correctAnswers,
    );
  }
}
