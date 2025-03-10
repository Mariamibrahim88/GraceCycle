part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class HomeSuccess extends HomeState {
  final FoodMenuModel foodMenuModel;
  HomeSuccess(this.foodMenuModel);
}

final class HomeError extends HomeState {
  final String errorMessage;
  HomeError(this.errorMessage);
}
