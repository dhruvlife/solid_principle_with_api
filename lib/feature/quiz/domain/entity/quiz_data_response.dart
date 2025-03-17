class QuizDataResponse {
  String? type;
  String? difficulty;
  String? category;
  String? question;
  String? correctAnswer;
  List<String>? incorrectAnswers;
  QuizDataResponse({
    this.category,
    this.correctAnswer,
    this.difficulty,
    this.incorrectAnswers,
    this.question,
    this.type,
  });
}
