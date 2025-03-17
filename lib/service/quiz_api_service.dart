import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:weather/core/secrets/end_points.dart';
import 'package:weather/core/secrets/secrets.dart';
import 'package:weather/feature/quiz/data/model/quiz.dart';
part 'quiz_api_service.g.dart';

@RestApi(baseUrl: Secrets.quizBaseUrl)
abstract class QuizApiService {
  factory QuizApiService(Dio dio, {String baseUrl}) = _QuizApiService;
  @GET(EndPoints.chat)
  Future<QuizModel> getQuizResponse(
    @Query("amount") int amount,
    @Query("type") String type,
  );
}
