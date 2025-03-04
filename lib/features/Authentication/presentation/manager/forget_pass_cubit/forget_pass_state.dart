part of 'forget_pass_cubit.dart';

@immutable
sealed class ForgetPassState {}

final class ForgetPassInitialState extends ForgetPassState {}

final class ForgetPassLoadingState extends ForgetPassState {}

final class ForgetPassSuccessState extends ForgetPassState {}

final class ForgetPassFailedState extends ForgetPassState {
  final String message;
  ForgetPassFailedState({required this.message});
}
