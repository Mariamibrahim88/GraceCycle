part of 'checkout_cubit.dart';

@immutable
sealed class CheckoutState {}

final class CheckoutInitial extends CheckoutState {}

final class IsOrderPlaced extends CheckoutState {
  final int selectedIndex;

  IsOrderPlaced(this.selectedIndex);
}

class CheckoutStepChanged extends CheckoutState {
  final int currentStep;

  CheckoutStepChanged({required this.currentStep});
}
