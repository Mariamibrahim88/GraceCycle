import 'dart:isolate';

import 'package:dartz/dartz.dart';
import 'package:grace_cycle/core/database/remote/api_consumer.dart';
import 'package:grace_cycle/core/errors/exceptions.dart';
import 'package:grace_cycle/core/service/service_locator.dart';
import 'package:grace_cycle/features/home/data/models/add_favourite_model.dart';
import 'package:grace_cycle/features/home/data/models/food_menu_model.dart';
import 'package:grace_cycle/features/home/data/models/vendors_model.dart';

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

  Future<Either<String, VendorsModel>> getVendor() async {
    try {
      final response = await sl<ApiConsumer>().get(
          'https://gracecycleapi.azurewebsites.net/api/HomeFlutter/vendors');

      final venderItemList = await Isolate.run(() {
      final Map<String, List<VendorItemModel>> result = {};
      response.forEach((vendor, vendorsList) {
        result[vendor] = (vendorsList as List)
            .map((item) => VendorItemModel.fromJson(item))
            .toList();
      });
      return result;
    });
      return Right(VendorsModel(vendors: venderItemList));
    } on ServerException catch (error) {
      return Left(error.errorModel.errorMessage);
    }
  }

  Future<Either<String, AddFavouriteModel>> addToFavoriteFood(int id) async {
    try {
      final response = await sl<ApiConsumer>().post(
          'https://gracecycleapi.azurewebsites.net/api/app/fav/foods?foodId=$id',
          data: {
            'foodId': id,
          });
      return Right(AddFavouriteModel.fromJson(response));
    } on ServerException catch (error) {
      return Left(error.errorModel.errorMessage);
    }
  }

  Future<Either<String, AddFavouriteModel>> removeFromFavoriteFood(
      int id) async {
    try {
      final response = await sl<ApiConsumer>().delete(
          'https://gracecycleapi.azurewebsites.net/api/app/fav/foods/$id');

      return Right(AddFavouriteModel.fromJson(response));
    } on ServerException catch (error) {
      return Left(error.errorModel.errorMessage);
    }
  }

  Future<Either<String, AddFavouriteModel>> addToFavoriteVendor(
      String id) async {
    try {
      final response = await sl<ApiConsumer>().post(
          'https://gracecycleapi.azurewebsites.net/api/app/fav/vendors?vendorId=$id',
          data: {
            'vendorId': id,
          });
      return Right(AddFavouriteModel.fromJson(response));
    } on ServerException catch (error) {
      return Left(error.errorModel.errorMessage);
    }
  }

  Future<Either<String, AddFavouriteModel>> removeFromFavoriteVendor(
      String id) async {
    try {
      final response = await sl<ApiConsumer>().delete(
          'https://gracecycleapi.azurewebsites.net/api/app/fav/vendors/$id');
      return Right(AddFavouriteModel.fromJson(response));
    } on ServerException catch (error) {
      return Left(error.errorModel.errorMessage);
    }
  }
}
