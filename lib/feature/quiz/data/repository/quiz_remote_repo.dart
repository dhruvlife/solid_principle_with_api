import 'package:weather/feature/quiz/data/model/quiz.dart';
import 'package:weather/service/quiz_api_service.dart';

abstract interface class QuizRemoteRepo {
  Future<QuizModel> getQuizResponse({required int amount});
}

class QuizImplRemoteRepo implements QuizRemoteRepo {
  final QuizApiService quizApiService;
  QuizImplRemoteRepo({required this.quizApiService});
  @override
  Future<QuizModel> getQuizResponse({required int amount}) async {
    return quizApiService.getQuizResponse(amount, "multiple");
  }
}
