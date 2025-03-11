import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:weather/core/common/app_text.dart';
import 'package:weather/feature/weather/presentation/cubit/waether_cubit.dart';
import 'package:weather/feature/weather/presentation/screen/widgets/weather_card.dart';

class HomeScreen extends StatelessWidget {
  final TextEditingController _cityController = TextEditingController();

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Weather App"),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Column(
            children: [
              TextField(
                controller: _cityController,
                decoration: InputDecoration(
                  labelText: "Enter city name",
                  border: OutlineInputBorder(),
                ),
              ).paddingOnly(bottom: 12.h),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                ),
                onPressed: () {
                  final cityName = _cityController.text.trim();
                  if (cityName.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("please enter a city name")),
                    );
                  } else {
                    context.read<WeatherCubit>().getWeather(cityName);
                  }
                },
                child: AppText(
                  data: "Get Weather",
                  fontSize: 16.sp,
                ),
              ).paddingOnly(bottom: 20.h),
              BlocBuilder<WeatherCubit, WeatherState>(
                builder: (context, state) {
                  if (state is WeatherLoading) {
                    return const CircularProgressIndicator();
                  } else if (state is WeatherLoaded) {
                    final weather = state.weather;
                    return WeatherCard(weather: weather);
                  } else if (state is WeatherError) {
                    return AppText(
                      data: state.message,
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    );
                  } else {
                    return Container();
                  }
                },
              ).paddingSymmetric(horizontal: 5.w, vertical: 5.h),
            ],
          ).paddingAll(16.sp),
        ),
      ),
    );
  }
}
