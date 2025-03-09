part of 'login_cubit.dart';

sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginLoading extends LoginState {}

final class LoginSuccessful extends LoginState {}

final class LoginFailure extends LoginState {
  final String errorMessage;

  LoginFailure(this.errorMessage);
}

final class LoginLoadingWithGoogle extends LoginState {}

final class LoginSuccessfulWithGoogle extends LoginState {}

final class LoginFailureWithGoogle extends LoginState {
  final String errorMessage;

  LoginFailureWithGoogle(this.errorMessage);
}
