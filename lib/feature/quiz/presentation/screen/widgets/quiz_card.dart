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
  final bool showAnswers;
  final bool isCorrect;
  final String correctAnswer;
  const QuestionCard({
    super.key,
    required this.question,
    required this.options,
    required this.onSelected,
    required this.currentQuestionNumber,
    required this.selectedAnswer,
    required this.showAnswers,
    required this.isCorrect,
    required this.correctAnswer,
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
              final isCorrectOption = option == correctAnswer;

              Color getOptionColor() {
                if (!showAnswers) {
                  return isSelected ? Colors.blue : Colors.white;
                } else {
                  if (isCorrectOption) return Colors.green;
                  if (isSelected && !isCorrectOption) {
                    return const Color.fromARGB(169, 253, 129, 120);
                  }
                  return Colors.white;
                }
              }
              return GestureDetector(
                onTap: () {
                  if (!showAnswers) {
                    onSelected(option);
                  }
                },
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: getOptionColor(),
                    border: Border.all(
                      color: isSelected ? Colors.blue : Colors.grey,
                    ),
                  ),
                  child: AppText(
                    data: option,
                    color: showAnswers && isCorrectOption
                        ? Colors.white
                        : Colors.black,
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
