import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'checkout_state.dart';

class CheckoutCubit extends Cubit<CheckoutState> {
  CheckoutCubit() : super(CheckoutInitial());

  int selectedIndex = 0;
  int currentStep = 0;

  void isOrderPlaced(int index) {
    selectedIndex = index;
    emit(IsOrderPlaced(index));
  }

  void goToNextStep() {
    if (currentStep < 3) {
      currentStep++;
      emit(CheckoutStepChanged(currentStep: currentStep));
    }
  }
}
