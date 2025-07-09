import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grace_cycle/features/details/data/models/food_item_details_model.dart';
import 'package:grace_cycle/features/details/data/models/vendor_item_details_model.dart';
import 'package:grace_cycle/features/details/data/repos/details_repo.dart';

part 'details_state.dart';

class DetailsCubit extends Cubit<DetailsState> {
  DetailsCubit(
    this.detailsRepo,
  ) : super(DetailsInitial());

  int quantity = 1;
  final DetailsRepo detailsRepo;
  FoodItemDetailsModel? foodItemDetails;

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

  void resetQuantity() {
    quantity = 1;
    emit(ResetQuantityState(quantity: quantity));
  }

  Future<void> getFoodDetails({required int id}) async {
    if (isClosed) return;
    emit(GetFoodByIdLoading());
    final response = await detailsRepo.getFoodDetails(id: id);
    if (isClosed) return;
    response.fold((error) => emit(GetFoodByIdFailure(errorMessage: error)),
        (r) {
      foodItemDetails = r;
      emit(GetFoodByIdSuccess(foodItemDetails: r));
    });
  }

  Future<void> getVendorDetails({required String id}) async {
    if (isClosed) return;
    emit(GetVendorByIdLoading());
    final response = await detailsRepo.getVendorDetails(vendorId: id);
    if (isClosed) return;
    response.fold(
      (error) => emit(GetVendorByIdFailure(errorMessage: error)),
      (r) => emit(GetVendorByIdSuccess(vendorItemDetails: r)),
    );
  }
}
