import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grace_cycle/features/cart/data/models/cart_items_for_any_vendor_model.dart';
import 'package:grace_cycle/features/cart/data/repos/cart_repo.dart';
import 'package:grace_cycle/features/cart/presentation/manager/cubit/cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit(this.cartRepo) : super(CartInit());

  final CartRepo cartRepo;
  List<CartItemsForAnyVendorModel>? cartItemsList = [];

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
}
