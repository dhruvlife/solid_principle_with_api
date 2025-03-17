import 'package:fpdart/fpdart.dart';
import 'package:weather/core/failure/failure.dart';
import 'package:weather/core/usecase/usecase.dart';
import 'package:weather/feature/quiz/domain/entity/quiz_entity.dart';
import 'package:weather/feature/quiz/domain/repository/quiz_repository.dart';

class QuizUsecase implements Usecase<QuizResponse, QuizParam> {
  final QuizRepository quizRepository;
  QuizUsecase({required this.quizRepository});
  @override
  Future<Either<Failure, QuizResponse>> call(QuizParam quizParam) {
    return quizRepository.getQuizResponse(amount:quizParam.amount);
  }
}

class QuizParam {
  final int amount;
  QuizParam({required this.amount});
}
