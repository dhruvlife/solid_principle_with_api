import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:weather/core/common/app_text.dart';

class WeatherDataDesign extends StatelessWidget {
  final String title;
  final String value;
  const WeatherDataDesign({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppText(
            data: title, color: Colors.white70, fontWeight: FontWeight.w500),
        AppText(
            data: value, color: Colors.white, fontWeight: FontWeight.w600),
      ],
    ).paddingSymmetric(vertical: 4.h);
  }
}