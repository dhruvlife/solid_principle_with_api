import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:weather/core/api_constants/base_url.dart';
import 'package:weather/core/api_constants/end_points.dart';
import 'package:weather/feature/weather/data/model/weather.dart';
part 'api_service.g.dart';

@RestApi(baseUrl: BaseUrl.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;
  @GET(EndPoints.weather)
  Future<Weather> getWeather(
    @Query("q") String cityName,
    @Query("appid") String apiKey,
    @Query("units") String units,
  );  
}
