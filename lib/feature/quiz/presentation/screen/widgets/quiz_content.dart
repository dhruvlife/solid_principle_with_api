import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:weather/core/common/app_text.dart';
import 'package:weather/feature/quiz/data/model/quiz.dart';
import 'package:weather/feature/quiz/presentation/cubit/quiz_cubit.dart';
import 'package:weather/feature/quiz/presentation/screen/widgets/quiz_card.dart';

class QuizContent extends StatefulWidget {
  final List<QuizDataModel> questions;
  const QuizContent({super.key, required this.questions});
  @override
  State<QuizContent> createState() => _QuizContentState();
}

class _QuizContentState extends State<QuizContent> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuizCubit, QuizState>(
      builder: (context, state) {
        return Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: widget.questions.length,
                itemBuilder: (context, index) {
                  final question = widget.questions[index];
                  return QuestionCard(
                    currentQuestionNumber: index + 1,
                    question: question.question!,
                    options: [
                      question.correctAnswer!,
                      question.incorrectAnswers![0],
                      question.incorrectAnswers![1],
                      question.incorrectAnswers![2],
                    ],
                    onSelected: (selected) {
                      context.read<QuizCubit>().selectAnswer(index, selected);
                      // setState(() {});
                    },
                    selectedAnswer:
                        context.read<QuizCubit>().selectedAnswers[index],
                  );
                },
              ),
            ),
            SizedBox(
              height: 50.h,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => context.read<QuizCubit>().calculateResult(),
                child: AppText(data: "Submit"),
              ),
            ).paddingSymmetric(vertical: 10.h, horizontal: 15.w),
          ],
        );
      },
    );
  }
}
