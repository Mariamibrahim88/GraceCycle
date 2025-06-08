import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grace_cycle/features/details/data/models/food_item_details_model.dart';
import 'package:grace_cycle/features/details/data/repos/food_details_repo.dart';
import 'package:meta/meta.dart';

part 'details_state.dart';

class DetailsCubit extends Cubit<DetailsState> {
  DetailsCubit(this.foodDetailsRepo) : super(DetailsInitial());

  int quantity = 1;
  final FoodDetailsRepo foodDetailsRepo;

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

  Future<void> getFoodDetails({required int id}) async {
    final response = await foodDetailsRepo.getFoodDetails(id: id);
    response.fold((error) => emit(GetFoodByIdFailure(errorMessage: error)),
        (r) => emit(GetFoodByIdSuccess(foodItemDetails: r)));
  }
}
