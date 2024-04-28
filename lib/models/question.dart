class Question {
  int id;
  String question;
  String? imageUrl;
  List<dynamic> options;
  String answerPostPath;

  Question(
      this.id, this.question, this.imageUrl, this.options, this.answerPostPath);
}
