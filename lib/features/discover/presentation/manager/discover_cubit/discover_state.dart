part of 'discover_cubit.dart';

@immutable
sealed class DiscoverState {}

final class DiscoverInitial extends DiscoverState {}

final class DiscoverVendorLoading extends DiscoverState {}

final class DiscoverVendorSuccess extends DiscoverState {
  final DiscoverVendorsModel vendorsModel;
  DiscoverVendorSuccess(this.vendorsModel);
}

final class DiscoverVendorFailure extends DiscoverState {
  final String errorMessage;
  DiscoverVendorFailure(this.errorMessage);
}

final class DiscoverVendorPaginationLoading extends DiscoverState {}

final class DiscoverVendorPaginationFailure extends DiscoverState {}
