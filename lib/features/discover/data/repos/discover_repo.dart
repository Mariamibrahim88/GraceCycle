import 'package:dartz/dartz.dart';
import 'package:grace_cycle/core/database/remote/api_consumer.dart';
import 'package:grace_cycle/core/errors/exceptions.dart';
import 'package:grace_cycle/core/service/service_locator.dart';
import 'package:grace_cycle/features/discover/data/models/vendors_discover_model.dart';

class DiscoverRepo {
  Future<Either<String, DiscoverVendorsModel>> getVendorDiscover({
    required int pageIndex,
    int? vendorTypeId,
    required pageSize,
    String? sort,
    String? search,
  }) async {
    try {
      final response = await sl<ApiConsumer>().get(
          'https://gracecycleapi.azurewebsites.net/api/app/discover/vendors',
          queryParameters: {
            'pageSize': pageSize,
            'pageIndex': pageIndex,
            if (vendorTypeId != null) 'vendorTypeId': vendorTypeId,
            if (sort != null) 'sort': sort,
            if (search != null) 'search': search,
          });

      return Right(
        DiscoverVendorsModel.fromJson(response),
      );
    } on ServerException catch (error) {
      return Left(error.errorModel.errorMessage);
    }
  }
}
