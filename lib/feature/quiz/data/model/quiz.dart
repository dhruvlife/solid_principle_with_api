import 'package:weather/feature/quiz/domain/entity/quiz_entity.dart';

class QuizResponse extends QuizEntity {
  QuizResponse({super.responseCode, super.results});

  QuizResponse.fromJson(Map<String, dynamic> json) {
    responseCode = json['response_code'];
    if (json['results'] != null) {
      results = <Quiz>[];
      json['results'].forEach((v) {
        results!.add(Quiz.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['response_code'] = responseCode;
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Quiz {
  String? type;
  String? difficulty;
  String? category;
  String? question;
  String? correctAnswer;
  List<String>? incorrectAnswers;

  Quiz(
      {this.type,
      this.difficulty,
      this.category,
      this.question,
      this.correctAnswer,
      this.incorrectAnswers});

  Quiz.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    difficulty = json['difficulty'];
    category = json['category'];
    question = json['question'];
    correctAnswer = json['correct_answer'];
    incorrectAnswers = json['incorrect_answers'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['difficulty'] = difficulty;
    data['category'] = category;
    data['question'] = question;
    data['correct_answer'] = correctAnswer;
    data['incorrect_answers'] = incorrectAnswers;
    return data;
  }
}
