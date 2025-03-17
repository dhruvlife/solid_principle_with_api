part of 'quiz_cubit.dart';
abstract class QuizState extends Equatable {
  const QuizState();
  @override
  List<Object> get props => [];
}

class QuizInitial extends QuizState {}
class QuizLoading extends QuizState {}

class QuizLoaded extends QuizState {
  final QuizResponse quiz;
  const QuizLoaded({required this.quiz});
  @override
  List<Object> get props => [quiz];
}

class QuizResult extends QuizState {
  final int correctAnswers;
  final int totalQuestions;
  const QuizResult({required this.correctAnswers,required this.totalQuestions});
  @override
  List<Object> get props => [correctAnswers, totalQuestions];
}

class QuizError extends QuizState {
  final String message;
  const QuizError({required this.message});
  @override
  List<Object> get props => [message];
}
