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

class GetOrderDetailsLoading extends CheckoutState {}

class GetOrderDetailsSuccess extends CheckoutState {
  final OrderDetailsModel orderDetails;

  GetOrderDetailsSuccess({required this.orderDetails});
}

class GetOrderDetailsError extends CheckoutState {
  final String error;
  GetOrderDetailsError({required this.error});
}

class GetOrderDeliveryLoading extends CheckoutState {}

class GetOrderDeliverySuccess extends CheckoutState {
  final OrderDeliveryModel orderDelivery;

  GetOrderDeliverySuccess({required this.orderDelivery});
}

class GetOrderDeliveryError extends CheckoutState {
  final String error;
  GetOrderDeliveryError({required this.error});
}

class PaymentLoading extends CheckoutState {}

class PaymentSuccess extends CheckoutState {}

class PaymentFailure extends CheckoutState {
  final String error;
  PaymentFailure(this.error);
}

class UpdateOrderDeliveryLoading extends CheckoutState {}

class UpdateOrderDeliverySuccess extends CheckoutState {
  final UpdateOrderDeliveryModel updateOrderDelivery;

  UpdateOrderDeliverySuccess({required this.updateOrderDelivery});
}

class UpdateOrderDeliveryError extends CheckoutState {
  final String error;
  UpdateOrderDeliveryError({required this.error});
}

class PaymentIntentLoading extends CheckoutState {}

class PaymentIntentSuccess extends CheckoutState {
  final PaymentIntentModel paymentIntent;

  PaymentIntentSuccess({required this.paymentIntent});
}

class PaymentIntentFailure extends CheckoutState {
  final String error;
  PaymentIntentFailure(this.error);
}
