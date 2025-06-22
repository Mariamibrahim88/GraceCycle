import 'package:grace_cycle/features/cart/data/models/add_item_to_cart_model.dart';
import 'package:grace_cycle/features/cart/data/models/cart_items_for_any_vendor_model.dart';
import 'package:grace_cycle/features/cart/data/models/cart_items_for_specefic_vendor_model.dart';

class CartState {}

final class CartInit extends CartState {}

final class GetCartItemsForAnyVendorLoading extends CartState {}

final class GetCartItemsForAnyVendorSuccess extends CartState {
  final List<CartItemsForAnyVendorModel> cartItemsForAnyVendorList;
  GetCartItemsForAnyVendorSuccess({required this.cartItemsForAnyVendorList});
}

final class GetCartItemsForAnyVendorFailure extends CartState {
  final String errorMessage;

  GetCartItemsForAnyVendorFailure({required this.errorMessage});
}

final class GetCartItemsForSpecificVendorLoading extends CartState {}

final class GetCartItemsForSpecificVendorSuccess extends CartState {
  final List<CartItemsForSpecificVendorModel> cartItemsForSpecificVendorList;
  GetCartItemsForSpecificVendorSuccess(
      {required this.cartItemsForSpecificVendorList});
}

final class GetCartItemsForSpecificVendorFailure extends CartState {
  final String errorMessage;
  GetCartItemsForSpecificVendorFailure({required this.errorMessage});
}


final class AddItemToCartLoading extends CartState {}
final class AddItemToCartSuccess extends CartState {
  final AddItemToCartModel addItemToCartModel;
  AddItemToCartSuccess({required this.addItemToCartModel});
}
final class AddItemToCartFailure extends CartState {
  final String errorMessage;
  AddItemToCartFailure({required this.errorMessage});
}