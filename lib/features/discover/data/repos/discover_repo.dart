import 'package:dartz/dartz.dart';
import 'package:grace_cycle/core/database/remote/api_consumer.dart';
import 'package:grace_cycle/core/errors/exceptions.dart';
import 'package:grace_cycle/core/service/service_locator.dart';
import 'package:grace_cycle/features/discover/data/models/discover_food_model.dart';
import 'package:grace_cycle/features/home/data/models/vendors_model.dart';

class DiscoverRepo {
  Future<Either<String, VendorsModel>> getVendorDiscover({
    required int pageIndex,
    int? vendorTypeId,
    String? sort,
    String? search,
  }) async {
    try {
      final response = await sl<ApiConsumer>().get(
          'https://gracecycleapi.azurewebsites.net/api/app/discover/vendors',
          queryParameters: {
            'pageSize': 10,
            'pageIndex': pageIndex,
            'vendorTypeId': vendorTypeId,
            'sort': sort,
            'search': search,
          });

      final Map<String, List<VendorItemModel>> vendorItemList = {};
      response.forEach((vendor, vendorsList) {
        vendorItemList[vendor] = (vendorsList as List)
            .map((item) => VendorItemModel.fromJson(item))
            .toList();
      });
      return Right(VendorsModel(vendors: vendorItemList));
    } on ServerException catch (error) {
      return Left(error.errorModel.errorMessage);
    }
  }

  Future<Either<String, DiscoverFoodModel>> getFoodDiscover(
    int pageIndex,
    int pageSize,
    int? categoryId,
    int? maxPrice,
    String? sort,
    String? search,
  ) async {
    try {
      final response = await sl<ApiConsumer>().get(
          'https://gracecycleapi.azurewebsites.net/api/app/discover/foods',
          queryParameters: {
            'pageSize': pageSize,
            'pageIndex': pageIndex,
            if (search != null && search.isNotEmpty) 'search': search,
            if (sort != null && sort.isNotEmpty) 'sort': sort,
            if (categoryId != null) 'categoryId': categoryId,
            if (maxPrice != null) 'maxPrice': maxPrice,
          });

      return Right(DiscoverFoodModel.fromJson(response));
    } on ServerException catch (error) {
      return Left(error.errorModel.errorMessage);
    }
  }
}
