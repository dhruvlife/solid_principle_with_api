import 'package:fpdart/fpdart.dart';
import 'package:weather/core/failure/failure.dart';
import 'package:weather/core/usecase/usecase.dart';
import 'package:weather/feature/quiz/domain/entity/quiz_entity.dart';
import 'package:weather/feature/quiz/domain/repository/repository.dart';

class QuizUsecase implements Usecase<QuizEntity,int>{
  final QuizRepository quizRepository;
  QuizUsecase(this.quizRepository);
  @override
  Future<Either<Failure, QuizEntity>> call(int amount) {
    return quizRepository.getQuizResponse(amount);
  }
}