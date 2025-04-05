import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grace_cycle/features/discover/data/models/discover_food_model.dart';
import 'package:grace_cycle/features/discover/data/models/vendors_discover_model.dart';
import 'package:grace_cycle/features/discover/data/repos/discover_repo.dart';

part 'discover_state.dart';

class DiscoverCubit extends Cubit<DiscoverState> {
  DiscoverCubit(this.discoverRepo) : super(DiscoverInitial());
  final DiscoverRepo discoverRepo;

  Future<void> getVendorDiscover({
    int pageIndex = 1,
    int pageSize = 10,
    int? vendorTypeId,
    String? sort,
    String? search,
  }) async {
    emit(DiscoverVendorLoading());
    final response = await discoverRepo.getVendorDiscover(
      pageIndex,
      vendorTypeId,
      pageSize,
      sort,
      search,
    );

    response.fold(
      (l) => emit(DiscoverVendorFailure(l)),
      (r) {
        pageIndex++;
        emit(DiscoverVendorSuccess(r));
      },
    );
  }

  Future<void> getFoodDiscover(
      {int pageIndex = 1,
      int pageSize = 10,
      int? categoryId,
      int? maxPrice,
      String? sort,
      String? search}) async {
    emit(DiscoverFoodLoading());

    final result = await discoverRepo.getFoodDiscover(
        pageIndex, pageSize, categoryId, maxPrice, sort, search);

    result.fold((ifLeft) => emit(DiscoverFoodFailure(ifLeft)), (ifRight) {
      pageIndex++;

      emit(DiscoverFoodSuccess(ifRight));
    });
  }
}
