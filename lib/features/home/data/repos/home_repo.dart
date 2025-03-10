import 'package:dartz/dartz.dart';
import 'package:grace_cycle/core/database/remote/api_consumer.dart';
import 'package:grace_cycle/core/errors/exceptions.dart';
import 'package:grace_cycle/core/service/service_locator.dart';
import 'package:grace_cycle/features/home/data/models/food_menu_model.dart';

class HomeRepo {
  Future<Either<String, FoodMenuModel>> getFoodMenue() async {
    try {
      final response = await sl<ApiConsumer>().get(
          'https://gracecycleapi.azurewebsites.net/api/HomeFlutter/ListedFoods');

      final Map<String, List<FoodItemModel>> categorizedFood = {};
      response.forEach((category, foodList) {
        categorizedFood[category] = (foodList as List)
            .map((item) => FoodItemModel.fromJson(item))
            .toList();
      });
      return Right(FoodMenuModel(categories: categorizedFood));
    } on ServerException catch (error) {
      return Left(error.errorModel.errorMessage);
    }
  }
}
