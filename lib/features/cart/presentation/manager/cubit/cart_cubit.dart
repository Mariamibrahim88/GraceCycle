import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grace_cycle/features/cart/data/models/cart_items_for_specefic_vendor_model.dart';
import 'package:grace_cycle/features/cart/data/models/update_item_model.dart';
import 'package:grace_cycle/features/cart/data/repos/cart_repo.dart';
import 'package:grace_cycle/features/cart/presentation/manager/cubit/cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit(this.cartRepo) : super(CartInit());

  final CartRepo cartRepo;
  List<CartItemsForSpecificVendorModel> cartItemsForSpecificVendorList = [];

  Future<void> getCartItemsForAnyVendor() async {
    emit(GetCartItemsForAnyVendorLoading());
    final response = await cartRepo.getCartItemsForAnyVendor();
    response.fold(
        (error) => emit(GetCartItemsForAnyVendorFailure(errorMessage: error)),
        (r) {
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
        cartItemsForSpecificVendorList =
            r.where((v) => v.items.isNotEmpty).toList();

        emit(GetCartItemsForSpecificVendorSuccess(
          cartItemsForSpecificVendorList: cartItemsForSpecificVendorList,
        ));
      },
    );
  }

  Future<void> updateCartForVendor({
    required String vendorId,
    required CartItemForUpdate item,
  }) async {
    emit(UpdateItemInCartLoading());

    final result = await cartRepo.updateItemInCart(
      vendorId: vendorId,
      cartItem: item,
    );

    result.fold(
      (error) => emit(UpdateItemInCartFailure(errorMessage: error)),
      (_) async {
        final response =
            await cartRepo.getCartItemsForSpecificVendor(vendorId: vendorId);
        response.fold(
          (error) =>
              emit(GetCartItemsForSpecificVendorFailure(errorMessage: error)),
          (r) {
            final updatedVendors = r
                .map((vendor) {
                  final filteredItems =
                      vendor.items.where((item) => item.quantity > 0).toList();

                  return CartItemsForSpecificVendorModel(
                    vendorId: vendor.vendorId,
                    vendorName: vendor.vendorName,
                    total: vendor.total,
                    count: vendor.count,
                    items: filteredItems,
                  );
                })
                .where((vendor) =>
                    vendor.items.isNotEmpty && vendor.vendorName.isNotEmpty)
                .toList();

            cartItemsForSpecificVendorList = updatedVendors;

            emit(GetCartItemsForSpecificVendorSuccess(
              cartItemsForSpecificVendorList: cartItemsForSpecificVendorList,
            ));
          },
        );
      },
    );
  }

  void changeItemQuantity({
    required String vendorId,
    required CartItem item,
    required bool isAdd,
  }) async {
    final updatedQuantity = isAdd ? item.quantity + 1 : item.quantity - 1;

    if (updatedQuantity < 1) {
      final updatedItem = CartItemForUpdate(
        id: item.id,
        name: item.name,
        quantity: 0,
        available: item.available,
        picUrl: item.picUrl,
        unitPrice: item.unitPrice,
        newPrice: item.newPrice,
      );

      await updateCartForVendor(vendorId: vendorId, item: updatedItem);
    } else {
      final updatedItem = CartItemForUpdate(
        id: item.id,
        name: item.name,
        quantity: updatedQuantity,
        available: item.available,
        picUrl: item.picUrl,
        unitPrice: item.unitPrice,
        newPrice: item.newPrice,
      );

      await updateCartForVendor(vendorId: vendorId, item: updatedItem);
    }
  }
}
