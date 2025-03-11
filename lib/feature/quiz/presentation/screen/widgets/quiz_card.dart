import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:weather/core/common/app_text.dart';

class QuestionCard extends StatelessWidget {
  final int currentQuestionNumber;
  final String question;
  final List<String> options;
  final Function(String) onSelected;
  final String? selectedAnswer;

  const QuestionCard({
    super.key,
    required this.question,
    required this.options,
    required this.onSelected,
    required this.currentQuestionNumber,
    required this.selectedAnswer,
  });
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Q$currentQuestionNumber: $question",
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ).paddingOnly(bottom: 10.h),
          Column(
            children: options.map((option) {
              final isSelected = option == selectedAnswer;
           

              
              return GestureDetector(
                onTap: () {
                
                },
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                
                    border: Border.all(
                      color: isSelected ? Colors.blue : Colors.grey,
                    ),
                  ),
                  child: AppText(
                    data: option,
                  
                  ).paddingAll(12.sp),
                ).marginSymmetric(vertical: 4.h),
              );
            }).toList(),
          )
        ],
      ).paddingAll(12.sp).marginSymmetric(vertical: 8.h, horizontal: 16.w),
    );
  }
}
