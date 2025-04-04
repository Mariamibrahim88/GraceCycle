part of 'get_fav_cubit.dart';

@immutable
sealed class GetFavState {}

final class GetFavInitial extends GetFavState {}

final class GetFavLoading extends GetFavState {}

final class GetFavSuccess extends GetFavState {
  final List<FavFoodModel> favfoodModel;

  GetFavSuccess(this.favfoodModel);
}

final class GetFavError extends GetFavState {
  final String errorMessage;

  GetFavError(this.errorMessage);
}

final class GetFavVendorsSuccess extends GetFavState {
  final List<FavVendorModel> favVendorModel;

  GetFavVendorsSuccess(this.favVendorModel);
}

final class GetFavVendorsError extends GetFavState {
  final String errorMessage;

  GetFavVendorsError(this.errorMessage);
}

final class GetFavVendorsLoading extends GetFavState {}
