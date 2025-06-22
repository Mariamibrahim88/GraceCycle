import 'package:dartz/dartz.dart';
import 'package:grace_cycle/core/database/remote/api_consumer.dart';
import 'package:grace_cycle/core/database/remote/end_points.dart';
import 'package:grace_cycle/core/errors/exceptions.dart';
import 'package:grace_cycle/core/service/service_locator.dart';
import 'package:grace_cycle/features/cart/data/models/add_item_to_cart_model.dart';
import 'package:grace_cycle/features/cart/data/models/cart_items_for_any_vendor_model.dart';
import 'package:grace_cycle/features/cart/data/models/cart_items_for_specefic_vendor_model.dart';
import 'package:grace_cycle/features/cart/data/models/update_item_model.dart';
import 'package:grace_cycle/features/details/data/models/food_item_details_model.dart';

class CartRepo {
  Future<Either<String, List<CartItemsForAnyVendorModel>>>
      getCartItemsForAnyVendor() async {
    try {
      final response = await sl<ApiConsumer>().get(EndPoint.cart);

      final List<CartItemsForAnyVendorModel> items = (response as List)
          .map((item) => CartItemsForAnyVendorModel.fromJson(item))
          .toList();
      return Right(items);
    } on ServerException catch (error) {
      return Left(error.errorModel.errorMessage);
    }
  }

  Future<Either<String, List<CartItemsForSpecificVendorModel>>>
      getCartItemsForSpecificVendor({required String vendorId}) async {
    try {
      final response = await sl<ApiConsumer>()
          .get(EndPoint.getCartsForSpecificVendor(vendorId));

      final item = CartItemsForSpecificVendorModel.fromJson(response);
      return Right([item]);
    } on ServerException catch (error) {
      return Left(error.errorModel.errorMessage);
    }
  }

  Future<Either<String, AddItemToCartModel>> addItemToCart({
    required FoodItemDetailsModel foodItemDetailsModel,
    required int quantity,
  }) async {
    try {
      final response =
          await sl<ApiConsumer>().post(EndPoint.addItemToCart, data: {
        "vendorId": foodItemDetailsModel.vendorId,
        "item": {
          "id": foodItemDetailsModel.id,
          "name": foodItemDetailsModel.name,
          "picUrl": foodItemDetailsModel.picUrl,
          "unitPrice": foodItemDetailsModel.unitPrice,
          "newPrice": foodItemDetailsModel.newPrice,
          "quantity": quantity,
        },
        "VendorName": foodItemDetailsModel.vName,
      });
      return Right(AddItemToCartModel.fromJson(response));
    } on ServerException catch (error) {
      return Left(error.errorModel.errorMessage);
    }
  }
}

Future<Either<String, UpdateItemModel>> updateItemInCart({
  required String vendorId,
  required CartItemForUpdate cartItem,
}) async {
  try {
    final response = await sl<ApiConsumer>().post(
      EndPoint.updateItemInCart,
      data: {
        ApiKeys.vendorId: vendorId,
        ApiKeys.cartItems: cartItem.toJson(),
      },
    );

    final updatedCart = UpdateItemModel.fromJson(response);

    return Right(updatedCart);
  } on ServerException catch (error) {
    return Left(error.errorModel.errorMessage);
  }
}
