import 'package:dartz/dartz.dart';
import 'package:grace_cycle/core/database/remote/api_consumer.dart';
import 'package:grace_cycle/core/errors/exceptions.dart';
import 'package:grace_cycle/core/service/service_locator.dart';
import 'package:grace_cycle/features/favorites/data/models/fav_food_model.dart';
import 'package:grace_cycle/features/favorites/data/models/fav_vendor_model.dart';
import 'package:grace_cycle/features/home/data/models/add_favourite_model.dart';

class FavRepo {
  // Future<Either<String, List<FoodFavResponse>>> getFavouriteFood() async {
  //   try {
  //     final response = await sl<ApiConsumer>()
  //         .get('https://gracecycleapi.azurewebsites.net/api/app/fav/foods');

  //     return Right(
  //         (response as List).map((e) => FoodFavResponse.fromJson(e)).toList());
  //   } on ServerException catch (error) {
  //     return Left(error.errorModel.errorMessage);
  //   }
  // }

  Future<Either<String, FoodFavResponse>> getFavouriteFood(
    int pageIndex,
    int pageSize,
    int? categoryId,
    int? maxPrice,
    String? sort,
    String? search,
  ) async {
    try {
      final response = await sl<ApiConsumer>().get(
          'https://gracecycleapi.azurewebsites.net/api/app/fav/foods',
          queryParameters: {
            'pageSize': pageSize,
            'pageIndex': pageIndex,
            if (search != null && search.isNotEmpty) 'search': search,
            if (sort != null && sort.isNotEmpty) 'sort': sort,
            if (categoryId != null) 'categoryId': categoryId,
            if (maxPrice != null) 'maxPrice': maxPrice,
          });

      return Right(FoodFavResponse.fromJson(response));
    } on ServerException catch (error) {
      return Left(error.errorModel.errorMessage);
    }
  }

  Future<Either<String, List<FavVendorModel>>> getFavouriteVendor() async {
    try {
      final response = await sl<ApiConsumer>()
          .get('https://gracecycleapi.azurewebsites.net/api/app/fav/vendors');

      return Right(
          (response as List).map((e) => FavVendorModel.fromJson(e)).toList());
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
