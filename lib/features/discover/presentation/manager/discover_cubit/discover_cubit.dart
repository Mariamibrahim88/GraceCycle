import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grace_cycle/features/discover/data/repos/discover_repo.dart';
import 'package:grace_cycle/features/home/data/models/food_menu_model.dart';
import 'package:grace_cycle/features/home/data/models/vendors_model.dart';

part 'discover_state.dart';

class DiscoverCubit extends Cubit<DiscoverState> {
  DiscoverCubit(this.discoverRepo) : super(DiscoverInitial());
  final DiscoverRepo discoverRepo;

  int _pageIndex = 1;
  bool isLoadingMore = false;
  List<FoodItemModel> allFoodItems = [];
  TextEditingController serachController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  List<VendorItemModel> vendorList = [];
  int noSearch = 0;

  int pageIndex = 1;

  Future<void> getVendorDiscover({
    bool loadingFromPagination = false,
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
      search ?? serachController.text,
    );

    response.fold(
      (l) {
        emit(DiscoverVendorFailure(l));
      },
      (r) {
        if (r.data.isNotEmpty) {
          vendorList.addAll(r.data);
          pageIndex++;
          emit(DiscoverVendorSuccess(vendorList));
        } else {
          emit(DiscoverVendorSuccess(vendorList));
        }
      },
    );
  }

  Future<void> getFoodDiscover(
      {bool isInitial = false,
      int pageSize = 10,
      int? categoryId,
      int? maxPrice,
      String? sort,
      String? search}) async {
    if (isInitial) {
      _pageIndex = 1;
      allFoodItems.clear();
      emit(DiscoverFoodLoading());
    }

    if (isLoadingMore) return;

    isLoadingMore = true;
    if (_pageIndex == 1) emit(DiscoverFoodLoading());
    final result = await discoverRepo.getFoodDiscover(_pageIndex, pageSize,
        categoryId, maxPrice, sort, search ?? serachController.text);

    result.fold((ifLeft) => emit(DiscoverFoodFailure(ifLeft)), (ifRight) {
      if (ifRight.data.isNotEmpty) {
        allFoodItems.addAll(ifRight.data);
        _pageIndex++;

        emit(DiscoverFoodSuccess(allFoodItems));
      } else {
        emit(DiscoverFoodSuccess(allFoodItems));
      }
    });
    isLoadingMore = false;
  }
}
