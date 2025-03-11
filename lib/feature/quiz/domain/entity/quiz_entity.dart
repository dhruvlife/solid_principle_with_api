import 'package:weather/feature/quiz/data/model/quiz.dart';

class QuizEntity {
  int? responseCode;
  List<Quiz>? results;
  QuizEntity({
    this.responseCode,
    this.results,
  });
}
