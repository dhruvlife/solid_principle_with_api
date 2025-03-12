import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:weather/core/failure/failure.dart';
import 'package:weather/feature/quiz/data/repository/quiz_remote_repo.dart';
import 'package:weather/feature/quiz/domain/entity/quiz_entity.dart';
import 'package:weather/feature/quiz/domain/repository/repository.dart';

class QuizImplRepo implements QuizRepository {
  final QuizRemoteRepo quizRemoteRepo;
  QuizImplRepo(this.quizRemoteRepo);
  
  @override
  Future<Either<Failure, QuizEntity>> getQuizResponse(int amount) async {
    try {
      final quizResponse = await quizRemoteRepo.getQuizResponse(amount);
      return Right(quizResponse);
    } on DioException catch (e) {
      return Left(Failure("An error occurred: ${e.message}"));
    }
  }
}
