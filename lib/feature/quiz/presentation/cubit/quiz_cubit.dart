import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:weather/core/failure/failure.dart';
import 'package:weather/feature/quiz/domain/entity/quiz_entity.dart';
import 'package:weather/feature/quiz/domain/usercase.dart/quiz_usecase.dart';

part 'quiz_state.dart';

class QuizCubit extends Cubit<QuizState> {
  final QuizUsecase quizUsecase;
  QuizCubit(this.quizUsecase) : super(QuizInitial());
  void getQuizResponse(int amount) async {
    emit(QuizLoading());
    final Either<Failure, QuizEntity> result = await quizUsecase.call(amount);
    result.fold(
      (failure) => emit(QuizError(failure.messege)),
      (quiz) => emit(QuizLoaded(quiz)),
    );
  }
}
