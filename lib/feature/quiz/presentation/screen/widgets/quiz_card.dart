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
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.r)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
                  data: "Q$currentQuestionNumber: $question",
                  fontWeight: FontWeight.bold)
              .paddingOnly(bottom: 6.h),
          Column(
            children: options.map((option) {
              final isSelected = option == selectedAnswer;
              return GestureDetector(
                onTap: () {
                  onSelected(option);
                },
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: isSelected ? Colors.blue : Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                    color: isSelected ? Colors.blue : Colors.white,
                  ),
                  child: Text(option).paddingAll(12.sp),
                ).marginSymmetric(vertical: 4.h),
              );
            }).toList(),
          ),
        ],
      ).paddingAll(15.sp),
    );
  }
}
