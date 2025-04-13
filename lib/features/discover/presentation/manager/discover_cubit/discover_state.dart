part of 'discover_cubit.dart';

sealed class DiscoverState {}

final class DiscoverInitial extends DiscoverState {}

final class DiscoverVendorLoading extends DiscoverState {}

final class DiscoverVendorSuccess extends DiscoverState {
  final List<VendorItemModel> vendorList;
  DiscoverVendorSuccess(this.vendorList);
}

final class DiscoverVendorFailure extends DiscoverState {
  final String errorMessage;
  DiscoverVendorFailure(this.errorMessage);
}

final class DiscoverFoodLoading extends DiscoverState {}

final class DiscoverFoodSuccess extends DiscoverState {
  final List<FoodItemModel> discoverFoodModel;
  DiscoverFoodSuccess(this.discoverFoodModel);
}

final class DiscoverFoodFailure extends DiscoverState {
  final String errorMessage;
  DiscoverFoodFailure(this.errorMessage);
}

final class DiscoverVendorPaginationLoading extends DiscoverState {}

final class DiscoverVendorPaginationFailure extends DiscoverState {
  final String errorMessage;
  DiscoverVendorPaginationFailure(this.errorMessage);
}

final class VendorTypesSucess extends DiscoverState {
  final List<VendorsTypeModel> vendorTypes;
  VendorTypesSucess(this.vendorTypes);
}

final class VendorTypesLoading extends DiscoverState {}

final class VendorTypesFailure extends DiscoverState {
  final String errorMessage;
  VendorTypesFailure(this.errorMessage);
}

final class IsFilterVisible extends DiscoverState {}

final class UpdateSort extends DiscoverState {}

final class IsExpanded extends DiscoverState {}

final class ChangeTap extends DiscoverState {}

final class GetCategoriesLoading extends DiscoverState {}

final class GetCategoriesSuccess extends DiscoverState {
  final List<GetCategoriesModel> categoriesList;
  GetCategoriesSuccess(this.categoriesList);
}

final class GetCategoriesFailure extends DiscoverState {
  final String errorMessage;
  GetCategoriesFailure(this.errorMessage);
}
