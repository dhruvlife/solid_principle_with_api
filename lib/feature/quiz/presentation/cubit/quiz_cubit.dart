import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:weather/core/failure/failure.dart';
import 'package:weather/feature/quiz/domain/entity/quiz_entity.dart';
import 'package:weather/feature/quiz/domain/usercase.dart/quiz_usecase.dart';
part 'quiz_state.dart';

class QuizCubit extends Cubit<QuizState> {
  final QuizUsecase quizUsecase;
  QuizCubit({required this.quizUsecase}) : super(QuizInitial());

  final Map<int, String> selectedAnswers = {};

  void getQuizResponse(int amount) async {
    emit(QuizLoading());
    final Either<Failure, QuizResponse> result = await quizUsecase.call(QuizParam(amount: amount));
    result.fold(
      (failure) => emit(QuizError(message: failure.messege)),
      (quiz) => emit(QuizLoaded(quiz:quiz)),
    );
  }

  void selectAnswer(int questionIndex, String answer) {
    selectedAnswers[questionIndex] = answer;
  }

  void calculateResult() {
    final questions = (state as QuizLoaded).quiz.results!;
    int correctCount = 0;
    for (int i = 0; i < questions.length; i++) {
      if (selectedAnswers[i] == questions[i].correctAnswer) {
        correctCount++;
      }
    }
    emit(QuizResult(totalQuestions: questions.length, correctAnswers: correctCount,));
  }

  void resetQuiz() {
    selectedAnswers.clear();
    emit(QuizInitial());
  }
}
