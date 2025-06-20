import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grace_cycle/features/cart/data/models/cart_items_for_any_vendor_model.dart';
import 'package:grace_cycle/features/cart/data/models/cart_items_for_specefic_vendor_model.dart';
import 'package:grace_cycle/features/cart/data/repos/cart_repo.dart';
import 'package:grace_cycle/features/cart/presentation/manager/cubit/cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit(this.cartRepo) : super(CartInit());

  final CartRepo cartRepo;
  List<CartItemsForAnyVendorModel>? cartItemsList = [];
  List<CartItemsForSpecificVendorModel>? cartItemsForSpecificVendorList = [];

  Future<void> getCartItemsForAnyVendor() async {
    emit(GetCartItemsForAnyVendorLoading());
    final response = await cartRepo.getCartItemsForAnyVendor();
    response.fold(
        (error) => emit(GetCartItemsForAnyVendorFailure(errorMessage: error)),
        (r) {
      cartItemsList = r;
      emit(GetCartItemsForAnyVendorSuccess(cartItemsForAnyVendorList: r));
    });
  }

  Future<void> getCartItemsForSpecificVendor({required String vendorId}) async {
    emit(GetCartItemsForSpecificVendorLoading());
    final response =
        await cartRepo.getCartItemsForSpecificVendor(vendorId: vendorId);
    response.fold(
        (error) =>
            emit(GetCartItemsForSpecificVendorFailure(errorMessage: error)),
        (r) {
      cartItemsForSpecificVendorList = r;
      emit(GetCartItemsForSpecificVendorSuccess(
          cartItemsForSpecificVendorList: r));
    });
  }
}
