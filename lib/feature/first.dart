import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:weather/core/common/app_text.dart';
import 'package:weather/core/routes/routes_name.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height:50.h ,
            width: double.infinity,
            child: ElevatedButton(onPressed: (){
              Get.toNamed(RoutesName.home);
            }, child: AppText(data: "Weather")),
          ).paddingOnly(bottom: 20.h),
          SizedBox(
            height:50.h ,
            width: double.infinity,
            child: ElevatedButton(onPressed: (){
               Get.toNamed(RoutesName.quiz);
            }, child: AppText(data: "Quiz")),
          ),
        ],
      ).paddingSymmetric(horizontal: 20.w),
    );
  }
}