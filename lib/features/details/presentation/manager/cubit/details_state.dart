part of 'details_cubit.dart';

@immutable
sealed class DetailsState {}

final class DetailsInitial extends DetailsState {}

final class IncreaseQuantityState extends DetailsState {
  final int quantity;

  IncreaseQuantityState({required this.quantity});
}

final class DecreaseQuantityState extends DetailsState {
  final int quantity;

  DecreaseQuantityState({required this.quantity});
}

final class ReviewVisibilityState extends DetailsState {}

final class AddToCartState extends DetailsState {
  final int quantity;

  AddToCartState({required this.quantity});
}

final class GetFoodByIdLoading extends DetailsState {}

final class GetFoodByIdSuccess extends DetailsState {
  final FoodItemDetailsModel foodItemDetails;

  GetFoodByIdSuccess({required this.foodItemDetails});
}

final class GetFoodByIdFailure extends DetailsState {
  final String errorMessage;

  GetFoodByIdFailure({required this.errorMessage});
}



final class GetVendorByIdLoading extends DetailsState {}

final class GetVendorByIdSuccess extends DetailsState {
  final VendorItemDetailsModel vendorItemDetails;

  GetVendorByIdSuccess({required this.vendorItemDetails});
}

final class GetVendorByIdFailure extends DetailsState {
  final String errorMessage;

  GetVendorByIdFailure({required this.errorMessage});
}
