import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:weather/core/common/app_text.dart';
import 'package:weather/core/constant/app_strings.dart';
import 'package:weather/feature/quiz/data/model/quiz.dart';
import 'package:weather/feature/quiz/presentation/cubit/quiz_cubit.dart';
import 'package:weather/feature/quiz/presentation/screen/widgets/quiz_card.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});
  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  final Map<int, String> selectedAnswers = {};
  final Map<int, bool> answerResults = {};
  bool showAnswers = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppText(
          data: AppStrings.quiz,
          fontWeight: FontWeight.bold,
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<QuizCubit, QuizState>(
        builder: (context, state) {
          if (state is QuizLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is QuizError) {
            return Center(child: Text(state.message));
          } else if (state is QuizLoaded) {
            final questions = state.quiz.results;
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: questions!.length,
                    itemBuilder: (context, index) {
                      final question = questions[index];
                      return QuestionCard(
                          currentQuestionNumber: index + 1,
                          question: question.question!,
                          options: [
                            question.correctAnswer!,
                            question.incorrectAnswers![0],
                            question.incorrectAnswers![1],
                            question.incorrectAnswers![2]
                          ],
                          onSelected: (selected) {
                            setState(() {
                              selectedAnswers[index] = selected;
                            });
                          },
                          selectedAnswer: selectedAnswers[index],
                          showAnswers: showAnswers,
                          isCorrect: answerResults[index] ?? false,
                          correctAnswer: question.correctAnswer!);
                    },
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => calculateResult(questions),
                    child: AppText(
                      data: AppStrings.submit,
                    ),
                  ).paddingAll(12.sp),
                ),
              ],
            );
          }
          return Center(
            child: ElevatedButton(
              onPressed: () {
                context.read<QuizCubit>().getQuizResponse(10);
              },
              child: AppText(data: AppStrings.startQuiz),
            ),
          );
        },
      ),
    );
  }

  void calculateResult(List<Quiz> questions) {
    int correctAnswers = 0;
    for (int i = 0; i < questions.length; i++) {
      if (selectedAnswers[i] == questions[i].correctAnswer) {
        answerResults[i] = true;
        correctAnswers++;
      } else {
        answerResults[i] = false;
      }
    }
    setState(() {
      showAnswers = true;
    });
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: AppText(data: AppStrings.quizResult),
        content: AppText(
            data:
                "${AppStrings.quizCorrAns} : $correctAnswers / ${questions.length}"),
        actions: [
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: AppText(data: "Ok"),
          ),
        ],
      ),
    );
  }
}
