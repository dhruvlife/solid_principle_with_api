import 'package:weather/core/api_constants/secrets.dart';
import 'package:weather/feature/weather/data/model/weather.dart';
import 'package:weather/service/api_service.dart';
abstract interface class WeatherRemoteRepo {
  Future<Weather> getWeather(String cityName);
}
class WeatherImplRemoteRepo implements WeatherRemoteRepo{
  final ApiService apiService;

  WeatherImplRemoteRepo(this.apiService);

  @override
  Future<Weather> getWeather(String cityName) async {
    return await apiService.getWeather(cityName, ApiSecrets.apiKey, "metric");
  }
}