import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:weather/core/constant/app_strings.dart';
import 'package:weather/core/failure/failure.dart';
import 'package:weather/feature/weather/data/repository/weather_remote_repo.dart';
import 'package:weather/feature/weather/domain/entities/weather_entity.dart';
import 'package:weather/feature/weather/domain/repository/weather_repo.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherRemoteRepo weatherRemoteRepo;
  WeatherRepositoryImpl({required this.weatherRemoteRepo});
  @override
  Future<Either<Failure, WeatherEntity>> getWeather({required String cityName}) async {
    try {
      final response = await weatherRemoteRepo.getWeather(cityName: cityName);
      return Right(response);
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        return Left(Failure(messege: AppStrings.weatherError));
      } else {
        return Left(Failure(messege: "An error occurred: ${e.message}"));
      }
    }
  }
}
