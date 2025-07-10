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

class ConvertCartToOrderLoading extends CheckoutState {}

class ConvertCartToOrderSuccess extends CheckoutState {
  final OrderModel order;

  ConvertCartToOrderSuccess({required this.order});
}

class ConvertCartToOrderError extends CheckoutState {
  final String error;

  ConvertCartToOrderError({required this.error});
}

class GetOrderSummaryLoading extends CheckoutState {}

class GetOrderSummarySuccess extends CheckoutState {
  final List<OrderSummaryModel> orderSummary;

  GetOrderSummarySuccess({required this.orderSummary});
}

class GetOrderSummaryError extends CheckoutState {
  final String error;

  GetOrderSummaryError({required this.error});
}
