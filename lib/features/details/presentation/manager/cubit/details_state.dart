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
