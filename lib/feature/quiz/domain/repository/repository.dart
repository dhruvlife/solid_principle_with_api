import 'package:fpdart/fpdart.dart';
import 'package:weather/core/failure/failure.dart';
import 'package:weather/feature/quiz/domain/entity/quiz_entity.dart';

abstract interface class QuizRepository{
  Future<Either<Failure,QuizEntity>> getQuizResponse(int amount);
}