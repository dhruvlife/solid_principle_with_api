import 'package:fpdart/fpdart.dart';
import 'package:weather/core/failure/failure.dart';
import 'package:weather/core/usecase/usecase.dart';
import 'package:weather/feature/weather/domain/entities/weather_entity.dart';
import 'package:weather/feature/weather/domain/repository/weather_repo.dart';

class WeatherUseCase implements Usecase<WeatherEntity, String> {
  final WeatherRepository _weatherRepository;

  WeatherUseCase(this._weatherRepository);

  @override
  Future<Either<Failure, WeatherEntity>> call(String cityName) {
    return _weatherRepository.getWeather(cityName);
  }
}
