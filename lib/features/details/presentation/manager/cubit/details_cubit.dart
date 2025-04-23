import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'details_state.dart';

class DetailsCubit extends Cubit<DetailsState> {
  DetailsCubit() : super(DetailsInitial());

  int quantity = 1;

  void increaseQuantity() {
    quantity++;
    emit(IncreaseQuantityState(quantity: quantity));
  }

  void decreaseQuantity() {
    if (quantity > 1) {
      quantity--;
    }
    emit(DecreaseQuantityState(quantity: quantity));
  }
}
