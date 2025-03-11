import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:weather/core/failure/failure.dart';
import 'package:weather/feature/weather/domain/entities/weather_entity.dart';
import 'package:weather/feature/weather/domain/usecase/weather_usecase.dart';
part 'waether_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final WeatherUseCase weatherUseCase;
  WeatherCubit(this.weatherUseCase) : super(WeatherInitial());
  void getWeather(String cityName) async {
    emit(WeatherLoading());
    final Either<Failure, WeatherEntity> result =
        await weatherUseCase.call(cityName);
    result.fold(
      (failure) => emit(WeatherError(failure.messege)),
      (weather) => emit(WeatherLoaded(weather)),
    );
  }
}
