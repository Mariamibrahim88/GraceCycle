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
    emit(GetFoodByIdLoading());
    final response = await detailsRepo.getFoodDetails(id: id);
    response.fold((error) => emit(GetFoodByIdFailure(errorMessage: error)),
        (r) => emit(GetFoodByIdSuccess(foodItemDetails: r)));
  }

  Future<void> getVendorDetails({required String id}) async {
    final response = await detailsRepo.getVendorDetails(vendorId: id);
    response.fold(
      (error) => emit(GetVendorByIdFailure(errorMessage: error)),
      (r) => emit(GetVendorByIdSuccess(vendorItemDetails: r)),
    );
  }
}
