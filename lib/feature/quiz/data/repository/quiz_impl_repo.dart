import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:weather/core/failure/failure.dart';
import 'package:weather/feature/quiz/data/repository/quiz_remote_repo.dart';
import 'package:weather/feature/quiz/domain/entity/quiz_entity.dart';
import 'package:weather/feature/quiz/domain/repository/quiz_repository.dart';


class QuizImplRepo implements QuizRepository {
  final QuizRemoteRepo quizRemoteRepo;
  QuizImplRepo({required this.quizRemoteRepo});
  
  @override
  Future<Either<Failure, QuizResponse>> getQuizResponse({required  int amount}) async {
    try {
      final quizResponse = await quizRemoteRepo.getQuizResponse(amount: amount);
      return Right(quizResponse);
    } on DioException catch (e) {
      return Left(Failure(messege:"An error occurred: ${e.message}"));
    }
  }
}
