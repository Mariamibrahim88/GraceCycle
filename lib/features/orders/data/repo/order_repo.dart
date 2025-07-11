import 'package:dartz/dartz.dart';
import 'package:grace_cycle/core/database/remote/api_consumer.dart';
import 'package:grace_cycle/core/database/remote/end_points.dart';
import 'package:grace_cycle/core/errors/exceptions.dart';
import 'package:grace_cycle/core/service/service_locator.dart';
import 'package:grace_cycle/features/orders/data/models/order_delivery_model.dart';
import 'package:grace_cycle/features/orders/data/models/order_details_model.dart';
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

  Future<Either<String, OrderDetailsModel>> getOrderDetails({required int orderId}) async {
    try {
      final response = await sl<ApiConsumer>().get(EndPoint.orderDetails(orderId));
      final orderDetails = OrderDetailsModel.fromJson(response);
      return Right(orderDetails);
    } on ServerException catch (e) {
      return Left(e.errorModel.errorMessage);
    }
  }

   Future<Either<String, OrderDeliveryModel>> getOrderDelivery({required int orderId})async{
     try {
      final response = await sl<ApiConsumer>().get(EndPoint.orderDelivery(orderId));
      final orderDelivery = OrderDeliveryModel.fromJson(response);
      return Right(orderDelivery);
    } on ServerException catch (e) {
      return Left(e.errorModel.errorMessage);
    }

  }

  //1
//   Future<Either<String, String>> createPaymentIntent(int amount) async {
//     try {
      
//       final response = await sl<ApiConsumer>().post(
//         EndPoint.createPaymentIntent,
//         // body: {'amount': amount.toString()},
//       );
//       final clientSecret = response['clientSecret'];
//       return Right(clientSecret);
//     } on ServerException catch (e) {
//       return Left(e.errorModel.errorMessage);
//     }
//   }


// Future<bool> confirmStripePayment(String clientSecret) async {
//   //2
//   await Stripe.instance.initPaymentSheet(
//     paymentSheetParameters: SetupPaymentSheetParameters(
//       paymentIntentClientSecret: clientSecret,
//       merchantDisplayName: 'Your App Name',
//     ),
//   );
//   try {
//     //3
//     await Stripe.instance.presentPaymentSheet();
//     return true;
//   } catch (e) {
//     rethrow;
//   }
// }
}
