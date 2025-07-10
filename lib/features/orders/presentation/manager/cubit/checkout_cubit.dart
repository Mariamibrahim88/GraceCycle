import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grace_cycle/core/service/service_locator.dart';
import 'package:grace_cycle/features/orders/data/models/order_details_model.dart';
import 'package:grace_cycle/features/orders/data/models/order_model.dart';
import 'package:grace_cycle/features/orders/data/models/order_summary_model.dart';
import 'package:grace_cycle/features/orders/data/repo/order_repo.dart';
import 'package:meta/meta.dart';

part 'checkout_state.dart';

class CheckoutCubit extends Cubit<CheckoutState> {
  CheckoutCubit(Object object) : super(CheckoutInitial());

  int selectedIndex = 0;
  int currentStep = 0;

  void isOrderPlaced(int index) {
    selectedIndex = index;
    emit(IsOrderPlaced(index));
  }

  void goToNextStep() {
    if (currentStep < 4) {
      currentStep++;
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
    print('loading.........');
    final result = await sl<OrderRepo>().getOrderDetails(orderId: orderId);

    result.fold((l) {
      emit(GetOrderDetailsError(error: l));
          print('error.........');

    }, (r) {
      emit(GetOrderDetailsSuccess(orderDetails: r));
          print('succ.........');

    });
  }
}
