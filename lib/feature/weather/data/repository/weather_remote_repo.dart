import 'package:weather/core/secrets/secrets.dart';
import 'package:weather/feature/weather/data/model/weather.dart';
import 'package:weather/service/api_service.dart';
abstract interface class WeatherRemoteRepo {
  Future<Weather> getWeather({required String cityName});
}
class WeatherImplRemoteRepo implements WeatherRemoteRepo{
  final ApiService apiService;

  WeatherImplRemoteRepo({required this.apiService});

  @override
  Future<Weather> getWeather({required String cityName}) async {
    return await apiService.getWeather(cityName, Secrets.apiKey, "metric");
  }
}