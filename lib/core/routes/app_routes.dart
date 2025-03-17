import 'package:get/get.dart';
import 'package:weather/core/routes/routes_name.dart';
import 'package:weather/feature/first.dart';
import 'package:weather/feature/quiz/presentation/screen/quiz_screen.dart';
import 'package:weather/feature/weather/presentation/screen/home.dart';

class AppRoutes {
  AppRoutes._();
  static List<GetPage<dynamic>> pages = [
    GetPage(name: RoutesName.first, page: () => FirstScreen()),
    GetPage(name: RoutesName.home, page: () => HomeScreen()),
    GetPage(name: RoutesName.quiz, page: () => QuizScreen()),
  ];
}
