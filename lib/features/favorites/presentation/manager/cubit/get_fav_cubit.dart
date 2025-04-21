import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grace_cycle/features/favorites/data/models/fav_food_model.dart';
import 'package:grace_cycle/features/favorites/data/models/fav_vendor_model.dart';
import 'package:grace_cycle/features/favorites/data/repos/fav_repo.dart';

part 'get_fav_state.dart';

class GetFavCubit extends Cubit<GetFavState> {
  GetFavCubit(this.favRepo) : super(GetFavInitial());

  final FavRepo favRepo;
  int _pageIndex = 1;
  //int pageIndexForVendors = 1;
  bool isLoadingMore = false;
  List<FoodItem> allFavFoodItems = [];
  String? nameOfSort;
  String? title;
  String? sortNameFood;
  String? sortNameVendor;
  bool hasMoreVendors = true;
  bool hasMoreFood = true;
  String? selectedSort;
  // List<VendorsTypeModel> vendorTypes = [];
  TextEditingController serachFavController = TextEditingController();
  GlobalKey<FormState> formFavKey = GlobalKey<FormState>();
  int? selectedVendorTypeId;
  int? selectedCategoryId;
  int? selectedMaxPrice;
  bool isFilterVisible = false;
  bool isExpanded = false;
  bool isFood = true;

  Future<void> getFavFood(
      {bool isInitial = false,
      int pageSize = 10,
      int? categoryId,
      int? maxPrice,
      String? sort,
      String? search}) async {
    if (isInitial) {
      // _pageIndex = 1;
      // allFoodItems.clear();
      emit(FavFoodPaginationLoading());
    } else {
      _pageIndex = 1;
      allFavFoodItems.clear();
      emit(GetFavLoading());
    }

    // if (isLoadingMore) return;

    isLoadingMore = true;
    // if (_pageIndex == 1) emit(DiscoverFoodLoading());
    final result = await favRepo.getFavouriteFood(
        _pageIndex,
        pageSize,
        categoryId ?? selectedCategoryId,
        maxPrice ?? selectedMaxPrice,
        sort ?? selectedSort,
        search ?? serachFavController.text);

    result.fold((ifLeft) => emit(GetFavError(ifLeft)), (ifRight) {
      if (ifRight.data.isNotEmpty) {
        allFavFoodItems.addAll(ifRight.data);
        _pageIndex++;

        // emit(DiscoverFoodSuccess(allFoodItems));
      } else {
        hasMoreFood = false;
      }
      emit(GetFavSuccess(allFavFoodItems));
    });
    isLoadingMore = false;
  }

  void getFavVendors() async {
    emit(GetFavVendorsLoading());

    final result = await favRepo.getFavouriteVendor();
    result.fold((error) => emit(GetFavVendorsError(error)),
        (r) => emit(GetFavVendorsSuccess(r)));
  }

  void removeFromFavoriteFood(int id) async {
    emit(RemoveFavLoading());

    final result = await favRepo.removeFromFavoriteFood(id);
    result.fold((error) => emit(RemoveFavError(error)), (r) {
      emit(RemoveFavSuccess());
      getFavFood();
    });
  }

  void removeFromFavoriteVendor(String id) async {
    emit(RemoveFavVendorLoading());

    final result = await favRepo.removeFromFavoriteVendor(id);
    result.fold((error) => emit(RemoveFavVendorError(error)), (r) {
      emit(RemoveFavVendorSuccess());
      getFavVendors();
    });
  }

  void changeIsFilterVisible() {
    isFilterVisible = !isFilterVisible;
    // if (isFilterVisible) {
    //   if (isFood) {
    //     getCategories();
    //   } else {
    //     getVendorTypes();
    //   }
    // }
    emit(IsFilterVisible());
  }

  void changeIsExpanded() {
    isExpanded = !isExpanded;
    emit(IsExpanded());
  }

  void dispose() {
    serachFavController.dispose();
    super.close();
  }
}
