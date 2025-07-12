import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grace_cycle/core/service/service_locator.dart';
import 'package:grace_cycle/features/orders/data/models/order_delivery_model.dart';
import 'package:grace_cycle/features/orders/data/models/order_details_model.dart';
import 'package:grace_cycle/features/orders/data/models/order_model.dart';
import 'package:grace_cycle/features/orders/data/models/order_summary_model.dart';
import 'package:grace_cycle/features/orders/data/models/payment_intent_model.dart';
import 'package:grace_cycle/features/orders/data/models/update_order_delivery_model.dart';
import 'package:grace_cycle/features/orders/data/repo/order_repo.dart';
import 'package:meta/meta.dart';
import 'dart:async';

part 'checkout_state.dart';

class CheckoutCubit extends Cubit<CheckoutState> {
  CheckoutCubit(Object object) : super(CheckoutInitial());

  double totalPrice = 0;
  int totalNumberOfitems = 0;

  int selectedIndex = 0;
  int currentStep = 0;
  bool isNeedAddress = false;

  // Add variables to store orderId and delivery address
  int? orderId;
  String deliveryAddress = '';

  // Add timer for debouncing delivery updates
  Timer? _deliveryUpdateTimer;

  // Add flag to track if delivery data has been initialized
  bool _isDeliveryDataInitialized = false;

  void isOrderPlaced(int index) {
    selectedIndex = index;
    emit(IsOrderPlaced(index));

    // Cancel previous timer if exists
    _deliveryUpdateTimer?.cancel();

    // Call updateOrderDelivery and getOrderDelivery when delivery method changes
    if (orderId != null) {
      int deliveryMethodId =
          index == 0 ? 1 : 2; // 1 for branch pickup, 2 for delivery
      String address = index == 1 ? deliveryAddress : '';

      // Add small delay to avoid too many API calls
      _deliveryUpdateTimer = Timer(const Duration(milliseconds: 300), () {
        // First update the order delivery to save changes
        updateOrderDelivery(
          orderId: orderId!,
          deliveryMethodId: deliveryMethodId,
          address: address,
        );
      });
    }
  }

  // Method to update delivery address
  void setDeliveryAddress(String address) {
    deliveryAddress = address;

    // Cancel previous timer if exists
    _deliveryUpdateTimer?.cancel();

    // Call updateOrderDelivery to save changes when address changes
    if (orderId != null && selectedIndex == 1) {
      // Add small delay to avoid too many API calls
      _deliveryUpdateTimer = Timer(const Duration(milliseconds: 500), () {
        int deliveryMethodId =
            selectedIndex == 0 ? 1 : 2; // Use correct delivery method ID
        updateOrderDelivery(
          orderId: orderId!,
          deliveryMethodId: deliveryMethodId,
          address: address,
        );
      });
    }
  }

  // Method to update orderId
  void setOrderId(int id) {
    orderId = id;
  }

  // Method to initialize delivery data when receiving section is opened
  void initializeDeliveryData() {
    if (orderId != null) {
      if (!_isDeliveryDataInitialized) {
        // First time: Call updateOrderDelivery with default values (branch pickup, no address)
        // This will save the initial state and then get updated totals
        updateOrderDelivery(
          orderId: orderId!,
          deliveryMethodId: 1, // Default to branch pickup
          address: '', // No address for branch pickup
        );
        _isDeliveryDataInitialized = true;
      } else {
        // Already initialized: Get current delivery data from backend to restore the state
        getOrderDelivery(
          orderId: orderId!,
          deliveryMethodId: null, // Let backend return current state
          address: null, // Let backend return current state
        );
      }
    }
  }

  // Method to validate delivery method and address
  bool isDeliveryValid() {
    // If delivery to home is selected, address is required
    if (selectedIndex == 1) {
      return deliveryAddress.trim().isNotEmpty;
    }
    // Branch pickup doesn't require address
    return true;
  }

  // Method to get validation error message
  String? getValidationError() {
    if (selectedIndex == 1 && deliveryAddress.trim().isEmpty) {
      return 'Please enter your delivery address';
    }
    return null;
  }

  void goToNextStep() {
    if (currentStep < 4) {
      currentStep++;
      emit(CheckoutStepChanged(currentStep: currentStep));
    }
  }

  void goToPreviousStep() {
    if (currentStep > 0) {
      currentStep--;
      emit(CheckoutStepChanged(currentStep: currentStep));
    }
  }

  void goToStep(int step) {
    if (step >= 0 && step <= 3) {
      currentStep = step;
      emit(CheckoutStepChanged(currentStep: currentStep));
    }
  }

  Future<void> convertCartToOrder(String vendorId) async {
    emit(ConvertCartToOrderLoading());
    final result = await sl<OrderRepo>().converCartToOrder(vendorId);
    result.fold((l) {
      emit(ConvertCartToOrderError(error: l));
    }, (r) {
      emit(ConvertCartToOrderSuccess(order: r));
    });
  }

  Future<void> getOrderSummary() async {
    emit(GetOrderSummaryLoading());
    final result = await sl<OrderRepo>().getOrderSummary();
    result.fold((l) {
      emit(GetOrderSummaryError(error: l));
    }, (r) {
      emit(GetOrderSummarySuccess(orderSummary: r));
    });
  }

  Future<void> getOrderDetails({required int orderId}) async {
    emit(GetOrderDetailsLoading());

    // Store orderId in cubit
    setOrderId(orderId);

    final result = await sl<OrderRepo>().getOrderDetails(orderId: orderId);

    result.fold((l) {
      emit(GetOrderDetailsError(error: l));
    }, (r) {
      emit(GetOrderDetailsSuccess(orderDetails: r));
      totalPrice = r.total;
      totalNumberOfitems = r.totalItems;
    });
  }

  Future<void> getOrderDelivery(
      {required int orderId, int? deliveryMethodId, String? address}) async {
    emit(GetOrderDeliveryLoading());

    final result = await sl<OrderRepo>().getOrderDelivery(
      orderId: orderId,
      deliveryMethodId: deliveryMethodId,
      address: address,
    );

    result.fold((l) {
      emit(GetOrderDeliveryError(error: l));
    }, (r) {
      emit(GetOrderDeliverySuccess(orderDelivery: r));
      // Update total price when delivery method changes
      totalPrice = r.total;
    });
  }

  Future<void> updateOrderDelivery(
      {required int orderId,
      required int deliveryMethodId,
      required String address}) async {
    emit(UpdateOrderDeliveryLoading());
    final result = await sl<OrderRepo>().updateOrderDelivery(
        orderId: orderId, deliveryMethodId: deliveryMethodId, address: address);
    result.fold((l) {
      emit(UpdateOrderDeliveryError(error: l));
    }, (r) {
      emit(UpdateOrderDeliverySuccess(updateOrderDelivery: r));
      // Call getOrderDelivery to get updated totals
      getOrderDelivery(
        orderId: orderId,
        deliveryMethodId: deliveryMethodId,
        address: address,
      );
    });
  }

  Future<void> paymentIntent({required int orderId}) async {
    emit(PaymentIntentLoading());
    final result = await sl<OrderRepo>().payemtIntent(orderId);
    result.fold((l) {
      emit(PaymentIntentFailure(l));
    }, (r) {
      emit(PaymentIntentSuccess(paymentIntent: r));
    });
  }

  Future<void> makePayment(int amount, String clientSecret) async {
    emit(PaymentLoading());
    try {
      await sl<OrderRepo>().confirmStripePayment(clientSecret);

      emit(PaymentSuccess());
    } catch (e) {
      emit(PaymentFailure(e.toString()));
    }
  }

  // Cleanup method to dispose of timer
  @override
  Future<void> close() {
    _deliveryUpdateTimer?.cancel();
    return super.close();
  }
}
