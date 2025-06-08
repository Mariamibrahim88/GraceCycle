import 'package:dartz/dartz.dart';
import 'package:grace_cycle/core/database/remote/api_consumer.dart';
import 'package:grace_cycle/core/database/remote/end_points.dart';
import 'package:grace_cycle/core/errors/exceptions.dart';
import 'package:grace_cycle/core/service/service_locator.dart';
import 'package:grace_cycle/features/details/data/models/food_item_details_model.dart';

class FoodDetailsRepo {
  Future<Either<String, FoodItemDetailsModel>> getFoodDetails(
      {required int id}) async {
    try {
      final response = await sl<ApiConsumer>().get(
        EndPoint.foodById(id),
      );
      return Right(FoodItemDetailsModel.fromJson(response));
    } on ServerException catch (error) {
      return Left(error.errorModel.errorMessage);
    }
  }
}
