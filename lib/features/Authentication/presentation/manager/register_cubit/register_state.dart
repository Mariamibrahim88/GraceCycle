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

class LocationLoading extends RegisterState {}

class LocationLoaded extends RegisterState {
  final String address;

  LocationLoaded(this.address);

  //@override
  List<Object> get props => [address];
}

final class LocationError extends RegisterState {
  final String message;

  LocationError(this.message);

  //@override
  List<Object> get props => [message];
}
