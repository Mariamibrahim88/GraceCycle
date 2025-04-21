part of 'get_fav_cubit.dart';

sealed class GetFavState {}

final class GetFavInitial extends GetFavState {}

final class GetFavLoading extends GetFavState {}

final class GetFavSuccess extends GetFavState {
  final List<FoodItem> favfoodModel;

  GetFavSuccess(this.favfoodModel);
}

final class GetFavError extends GetFavState {
  final String errorMessage;

  GetFavError(this.errorMessage);
}

final class FavFoodPaginationLoading extends GetFavState {}

final class GetFavVendorsSuccess extends GetFavState {
  final List<FavVendorModel> favVendorModel;

  GetFavVendorsSuccess(this.favVendorModel);
}

final class GetFavVendorsError extends GetFavState {
  final String errorMessage;

  GetFavVendorsError(this.errorMessage);
}

final class GetFavVendorsLoading extends GetFavState {}

final class RemoveFavLoading extends GetFavState {}

final class RemoveFavSuccess extends GetFavState {}

final class RemoveFavError extends GetFavState {
  final String errorMessage;

  RemoveFavError(this.errorMessage);
}

final class RemoveFavVendorSuccess extends GetFavState {}

final class RemoveFavVendorError extends GetFavState {
  final String errorMessage;
  RemoveFavVendorError(this.errorMessage);
}

final class RemoveFavVendorLoading extends GetFavState {}

final class IsFilterVisible extends GetFavState {}

final class IsExpanded extends GetFavState {}

final class UpdateSort extends GetFavState {}
