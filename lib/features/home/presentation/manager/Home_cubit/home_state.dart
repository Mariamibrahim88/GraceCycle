import 'package:grace_cycle/features/home/data/models/food_menu_model.dart';
import 'package:grace_cycle/features/home/data/models/vendors_model.dart';

class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class HomeVendorLoading extends HomeState {}

final class HomeSuccess extends HomeState {
  final FoodMenuModel foodMenuModel;
  HomeSuccess(this.foodMenuModel);
}

final class HomeVendorSuccess extends HomeState {
  final VendorsModel vendorsModel;
  HomeVendorSuccess(this.vendorsModel);
}

final class HomeError extends HomeState {
  final String errorMessage;
  HomeError(this.errorMessage);
}

final class HomeVendorError extends HomeState {
  final String errorMessage;
  HomeVendorError(this.errorMessage);
}

final class HomeAddToFavoriteSuccess extends HomeState {
  final String message;
  HomeAddToFavoriteSuccess(this.message);
}

final class HomeAddToFavoriteError extends HomeState {
  final String errorMessage;
  HomeAddToFavoriteError(this.errorMessage);
}

final class HomeUpdateFavorites extends HomeState {}

final class HomeUpdateVendorFavorites extends HomeState {}

final class HomeRemoveFromFavoriteSuccess extends HomeState {
  final String message;
  HomeRemoveFromFavoriteSuccess(this.message);
}

final class HomeRemoveFromFavoriteError extends HomeState {
  final String errorMessage;
  HomeRemoveFromFavoriteError(this.errorMessage);
}
