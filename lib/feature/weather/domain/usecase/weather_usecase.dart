import 'package:fpdart/fpdart.dart';
import 'package:weather/core/failure/failure.dart';
import 'package:weather/core/usecase/usecase.dart';
import 'package:weather/feature/weather/domain/entities/weather_entity.dart';
import 'package:weather/feature/weather/domain/repository/weather_repo.dart';

class WeatherUseCase implements Usecase<WeatherEntity, WeatherParam> {
  final WeatherRepository weatherRepository;

  WeatherUseCase({required this.weatherRepository});

  @override
  Future<Either<Failure, WeatherEntity>> call(WeatherParam weatherParam) {
    return weatherRepository.getWeather(cityName: weatherParam.city);
  }
}

class WeatherParam{
  final String city;
  WeatherParam({required this.city});
}