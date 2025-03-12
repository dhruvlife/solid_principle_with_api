import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:weather/feature/quiz/data/repository/quiz_impl_repo.dart';
import 'package:weather/feature/quiz/data/repository/quiz_remote_repo.dart';
import 'package:weather/feature/quiz/domain/repository/repository.dart';
import 'package:weather/feature/quiz/domain/usercase.dart/quiz_usecase.dart';
import 'package:weather/feature/quiz/presentation/cubit/quiz_cubit.dart';
import 'package:weather/feature/weather/data/repository/weather_remote_repo.dart';
import 'package:weather/feature/weather/data/repository/weather_impl_repository.dart';
import 'package:weather/feature/weather/domain/repository/weather_repo.dart';
import 'package:weather/feature/weather/domain/usecase/weather_usecase.dart';
import 'package:weather/feature/weather/presentation/cubit/waether_cubit.dart';
import 'package:weather/service/api_service.dart';
import 'package:weather/service/quiz_api_service.dart';
import 'package:weather/service/dio_client.dart';

final GetIt getIt = GetIt.instance;

void setupLocator() {
  getIt.registerSingleton<Dio>(DioClient.getDio(),instanceName: 'weatherDio',);
  getIt.registerSingleton<ApiService>(ApiService(getIt(instanceName: 'weatherDio')));
  getIt.registerSingleton<WeatherRemoteRepo>(WeatherImplRemoteRepo(getIt()));
  getIt.registerSingleton<WeatherRepository>(WeatherRepositoryImpl(getIt()));
  getIt.registerSingleton<WeatherUseCase>(WeatherUseCase(getIt()));
  getIt.registerFactory(() => WeatherCubit(getIt()));

  // chat
  getIt.registerSingleton<Dio>(DioClient.getQuizDio(),instanceName: 'quizDio',);
  getIt.registerSingleton<QuizApiService>(QuizApiService(getIt(instanceName: 'quizDio')));
  getIt.registerSingleton<QuizRemoteRepo>(QuizImplRemoteRepo(getIt()));
  getIt.registerSingleton<QuizRepository>(QuizImplRepo(getIt()));
  getIt.registerSingleton<QuizUsecase>(QuizUsecase(getIt()));
  getIt.registerFactory(() => QuizCubit(getIt()));
}
