import 'package:fpdart/fpdart.dart';
import 'package:weather/core/failure/failure.dart';
import 'package:weather/feature/weather/domain/entities/weather_entity.dart';

abstract interface class WeatherRepository {
  Future<Either<Failure, WeatherEntity>> getWeather(String cityName);
}
