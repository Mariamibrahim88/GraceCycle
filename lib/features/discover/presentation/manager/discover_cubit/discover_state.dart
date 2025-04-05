part of 'discover_cubit.dart';

sealed class DiscoverState {}

final class DiscoverInitial extends DiscoverState {}

final class DiscoverVendorLoading extends DiscoverState {}

final class DiscoverVendorSuccess extends DiscoverState {
  final VendorsModel vendorsModel;
  DiscoverVendorSuccess(this.vendorsModel);
}

final class DiscoverVendorFailure extends DiscoverState {
  final String errorMessage;
  DiscoverVendorFailure(this.errorMessage);
}

final class DiscoverFoodLoading extends DiscoverState {}

final class DiscoverFoodSuccess extends DiscoverState {
  final DiscoverFoodModel discoverFoodModel;
  DiscoverFoodSuccess(this.discoverFoodModel);
}

final class DiscoverFoodFailure extends DiscoverState {
  final String errorMessage;
  DiscoverFoodFailure(this.errorMessage);
}
