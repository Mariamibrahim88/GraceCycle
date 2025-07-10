import 'package:dartz/dartz.dart';
import 'package:grace_cycle/core/database/remote/api_consumer.dart';
import 'package:grace_cycle/core/database/remote/end_points.dart';
import 'package:grace_cycle/core/errors/exceptions.dart';
import 'package:grace_cycle/core/service/service_locator.dart';
import 'package:grace_cycle/features/orders/data/models/order_model.dart';
import 'package:grace_cycle/features/orders/data/models/order_summary_model.dart';

class OrderRepo {
  Future<Either<String, OrderModel>> converCartToOrder(String vendorId) async {
    try {
      final response =
          await sl<ApiConsumer>().post(EndPoint.convertCartToOrder(vendorId));
      final order = OrderModel.fromJson(response);

      return Right(order);
    } on ServerException catch (e) {
      return Left(e.errorModel.errorMessage);
    }
  }

  Future<Either<String, List<OrderSummaryModel>>> getOrderSummary() async {
    try {
      final response = await sl<ApiConsumer>().get(EndPoint.orderSummary);
      final orderSummary =
          (response as List).map((e) => OrderSummaryModel.fromJson(e)).toList();
      return Right(orderSummary);
    } on ServerException catch (e) {
      return Left(e.errorModel.errorMessage);
    }
  }
}
