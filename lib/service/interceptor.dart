import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:weather/core/secrets/secrets.dart';

class DioClient {
  static Dio getDio() {
    BaseOptions baseOptions = BaseOptions(
      baseUrl: Secrets.baseUrl,
      connectTimeout: Duration(seconds: 10),
      receiveTimeout: Duration(seconds: 10),
    );
    Dio dio = Dio(baseOptions);
    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,
      ),
    );
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        return handler.next(options);
      },
    ));
    return dio;
  }

  static Dio getQuizDio() {
    BaseOptions baseOptions = BaseOptions(
      baseUrl: Secrets.quizBaseUrl,
      connectTimeout: Duration(seconds: 10),
      receiveTimeout: Duration(seconds: 10),
    );
    Dio dio = Dio(baseOptions);
    dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
      compact: true,
      maxWidth: 90,
    ));
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        return handler.next(options);
      },
    ));
    return dio;
  }
}
