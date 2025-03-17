import 'package:weather/feature/quiz/domain/entity/quiz_data_response.dart';
import 'package:weather/feature/quiz/domain/entity/quiz_entity.dart';

class QuizModel extends QuizResponse {
  QuizModel({super.responseCode, super.results});

  QuizModel.fromJson(Map<String, dynamic> json) {
    responseCode = json['response_code'];
    if (json['results'] != null) {
      results = <QuizDataModel>[];
      json['results'].forEach((v) {
        results!.add(QuizDataModel.fromJson(v));
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

class QuizDataModel extends QuizDataResponse {
QuizDataModel({super.category,super.correctAnswer,super.difficulty,super.incorrectAnswers,super.question,super.type});


  QuizDataModel.fromJson(Map<String, dynamic> json) {
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
