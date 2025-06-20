import 'package:dartz/dartz.dart';
import 'package:grace_cycle/core/database/remote/api_consumer.dart';
import 'package:grace_cycle/core/database/remote/end_points.dart';
import 'package:grace_cycle/core/errors/exceptions.dart';
import 'package:grace_cycle/core/service/service_locator.dart';
import 'package:grace_cycle/features/cart/data/models/cart_items_for_any_vendor_model.dart';
import 'package:grace_cycle/features/cart/data/models/cart_items_for_specefic_vendor_model.dart';

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
}
