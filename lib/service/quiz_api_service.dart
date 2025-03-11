import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:weather/core/api_constants/base_url.dart';
import 'package:weather/core/api_constants/end_points.dart';
import 'package:weather/feature/quiz/data/model/quiz.dart';
part 'quiz_api_service.g.dart';

@RestApi(baseUrl: BaseUrl.quizBaseUrl)
abstract class QuizApiService {
  factory QuizApiService(Dio dio, {String baseUrl}) = _QuizApiService;
  @GET(EndPoints.chat)
  Future<QuizResponse> getQuizResponse(
    @Query("amount") int amount,
    @Query("type") String type,
  );
}
