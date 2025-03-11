import 'package:weather/feature/quiz/data/model/quiz.dart';
import 'package:weather/service/quiz_api_service.dart';

class QuizRemoteRepo {
  final QuizApiService quizApiService;
  QuizRemoteRepo(this.quizApiService);
  Future<QuizResponse> getQuizResponse(int amount)async{
    return quizApiService.getQuizResponse(amount,"multiple");
  }
}