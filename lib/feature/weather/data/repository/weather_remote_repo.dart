import 'package:weather/core/api_constants/secrets.dart';
import 'package:weather/feature/weather/data/model/weather.dart';
import 'package:weather/service/api_service.dart';

class WeatherRemoteRepo {
  final ApiService apiService;

  WeatherRemoteRepo(this.apiService);

  Future<Weather> getWeather(String cityName) async {
    return await apiService.getWeather(cityName, ApiSecrets.apiKey, "metric");
  }
}