import 'package:weather/feature/quiz/data/model/quiz.dart';
import 'package:weather/service/quiz_api_service.dart';

abstract interface class QuizRemoteRepo {
  Future<QuizResponse> getQuizResponse(int amount);
}

class QuizImplRemoteRepo implements QuizRemoteRepo {
  final QuizApiService quizApiService;
  QuizImplRemoteRepo(this.quizApiService);
  @override
  Future<QuizResponse> getQuizResponse(int amount) async {
    return quizApiService.getQuizResponse(amount, "multiple");
  }
}
// class QuizRemoteRepo {
//   final QuizApiService quizApiService;
//   QuizRemoteRepo(this.quizApiService);
//   Future<QuizResponse> getQuizResponse(int amount)async{
//     return quizApiService.getQuizResponse(amount,"multiple");
//   }
// }
