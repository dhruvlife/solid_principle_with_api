import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:weather/core/common/app_text.dart';
import 'package:weather/core/routes/routes_name.dart';
import 'package:weather/feature/quiz/presentation/cubit/quiz_cubit.dart';
import 'package:weather/feature/quiz/presentation/screen/widgets/quiz_content.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});
  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppText(data: "Quiz App", fontWeight: FontWeight.bold),
        centerTitle: true,
      ),
      body: BlocBuilder<QuizCubit, QuizState>(
        builder: (context, state) {
          if (state is QuizLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is QuizError) {
            return Center(child: Text(state.message));
          } else if (state is QuizLoaded) {
            return QuizContent(questions: state.quiz.results!);
          } else if (state is QuizResult) {
            return buildResultScreen(
                context, state.correctAnswers, state.totalQuestions);
          }
          return Center(
            child: ElevatedButton(
              onPressed: () {
                context.read<QuizCubit>().getQuizResponse(10);
              },
              child: const Text("Start Quiz"),
            ),
          );
        },
      ),
    );
  }

  Widget buildResultScreen(
      BuildContext context, int correctAnswers, int totalQuestions) {
    return AlertDialog(
      title: const Text("Quiz Result"),
      content: Text("Correct Answers: $correctAnswers / $totalQuestions"),
      actions: [
        TextButton(
          onPressed: () {
            context.read<QuizCubit>().resetQuiz();
            Get.toNamed(RoutesName.quiz);
          },
          child: const Text("OK"),
        ),
      ],
    );
  }
}
