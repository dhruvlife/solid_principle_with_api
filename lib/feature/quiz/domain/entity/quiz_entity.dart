import 'package:weather/feature/quiz/data/model/quiz.dart';

class QuizResponse {
  int? responseCode;
  List<QuizDataModel>? results;
  QuizResponse({
    this.responseCode,
    this.results,
  });
}
