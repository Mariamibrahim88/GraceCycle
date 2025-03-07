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

final class VerifyCodeLoadingState extends ForgetPassState {}

final class VerifyCodeSuccessState extends ForgetPassState {}

final class VerifyCodeFailedState extends ForgetPassState {
  final String message;
  VerifyCodeFailedState({required this.message});
}

final class ResetPassLoadingState extends ForgetPassState {}

final class ResetPassSuccessState extends ForgetPassState {}

final class ResetPassFailedState extends ForgetPassState {
  final String message;
  ResetPassFailedState({required this.message});
}
