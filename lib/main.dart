import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:weather/core/routes/app_routes.dart';
import 'package:weather/core/routes/routes_name.dart';
import 'package:weather/feature/quiz/presentation/cubit/quiz_cubit.dart';
import 'package:weather/feature/weather/presentation/cubit/waether_cubit.dart';
import 'package:weather/service/injection.dart';

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<WeatherCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<QuizCubit>(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        child: GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
            useMaterial3: true,
          ),
          initialRoute: RoutesName.first,
          getPages: AppRoutes.pages,
        ),
      ),
    );
  }
}
