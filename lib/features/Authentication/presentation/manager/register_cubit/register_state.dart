sealed class RegisterState {}

final class RegisterInitial extends RegisterState {}

final class RegisterLoadingState extends RegisterState {}

final class RegisterErrorState extends RegisterState {
  final String message;

  RegisterErrorState(this.message);
}

final class RegisterSucessState extends RegisterState {}

final class RegisterCheckboxState extends RegisterState {
  final List<bool> registerconditions;

  RegisterCheckboxState(this.registerconditions);
}
