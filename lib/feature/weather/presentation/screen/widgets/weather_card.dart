import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:weather/core/common/app_text.dart';
import 'package:weather/feature/weather/domain/entities/weather_entity.dart';
import 'package:weather/feature/weather/presentation/screen/widgets/weather_data_design.dart';

class WeatherCard extends StatelessWidget {
  const WeatherCard({
    super.key,
    required this.weather,
  });
  final WeatherEntity weather;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        gradient: LinearGradient(
          colors: [
            Colors.blue.shade800,
            Colors.cyan.shade400,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            data: "${weather.name}",
            fontWeight: FontWeight.w700,
            fontSize: 22.sp,
            color: Colors.white,
          ).paddingSymmetric(vertical: 10.h),
          WeatherDataDesign(title: "Latitude", value: "${weather.coord?.lat}°"),
          WeatherDataDesign(
              title: "Longitude", value: "${weather.coord?.lon}°"),
          WeatherDataDesign(
              title: "Visibility", value: "${weather.visibility}m"),
          WeatherDataDesign(
              title: "Wind Degree", value: "${weather.wind?.deg}°"),
          WeatherDataDesign(
              title: "Wind Speed", value: "${weather.wind?.speed} km/h"),
          WeatherDataDesign(
              title: "Temperature", value: "${weather.main?.temp}°C"),
          WeatherDataDesign(
              title: "Ground Level", value: "${weather.main?.grndLevel}"),
          WeatherDataDesign(
              title: "Humidity", value: "${weather.main?.humidity}%"),
          WeatherDataDesign(
              title: "Pressure", value: "${weather.main?.pressure} hPa"),
          WeatherDataDesign(
              title: "Sea Level", value: "${weather.main?.seaLevel}"),
          WeatherDataDesign(
              title: "Max Temp", value: "${weather.main?.tempMax}°C"),
          WeatherDataDesign(
              title: "Min Temp", value: "${weather.main?.tempMin}°C"),
          WeatherDataDesign(
              title: "Feels Like", value: "${weather.main?.feelsLike}°C"),
          WeatherDataDesign(
              title: "Overall Weather",
              value: "${weather.weather?.first.main}"),
          WeatherDataDesign(
              title: "Description",
              value: "${weather.weather?.first.description}"),
          WeatherDataDesign(title: "Powered by", value: "${weather.base}"),
        ],
      ).paddingAll(16.sp),
    );
  }
}
