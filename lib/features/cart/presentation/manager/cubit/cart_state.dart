import 'package:grace_cycle/features/cart/data/models/cart_items_for_any_vendor_model.dart';

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