import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grace_cycle/features/discover/presentation/manager/discover_cubit/discover_cubit.dart';
import 'package:grace_cycle/features/favorites/data/models/fav_food_model.dart';
import 'package:grace_cycle/features/favorites/data/models/fav_vendor_model.dart';
import 'package:grace_cycle/features/favorites/data/repos/fav_repo.dart';

part 'get_fav_state.dart';

class GetFavCubit extends Cubit<GetFavState> {
  GetFavCubit(this.favRepo) : super(GetFavInitial());

  final FavRepo favRepo;
  int _pageIndex = 1;
  int pageIndexForVendors = 1;
  bool isLoadingMore = false;
  bool isLoadingVendors = false;
  List<FoodItem> allFavFoodItems = [];
  String? nameOfSort;
  String? title;
  String? sortNameFood;
  String? sortNameVendor;
  bool hasMoreVendors = true;
  bool hasMoreFood = true;
  String? selectedSort;
  List<FavVendorItem> favVendorList = [];
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
    if (isClosed) return;
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
    if (isClosed) return;
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

  Future<void> getVendorFav({
    bool loadingFromPagination = false,
    int pageSize = 10,
    int? vendorTypeId,
    String? sort,
    String? search,
  }) async {
    if (isClosed) return;
    if (loadingFromPagination) {
      emit(FavVendorPaginationLoading());
    } else {
      pageIndexForVendors = 1;
      favVendorList.clear();
      emit(GetFavVendorsLoading());
    }

    isLoadingVendors = true;
    final response = await favRepo.getFavouriteVendor(
      pageIndexForVendors,
      vendorTypeId ?? selectedVendorTypeId,
      pageSize,
      sort ?? selectedSort,
      search ?? serachFavController.text,
    );
    if (isClosed) return;
    response.fold(
      (l) {
        emit(GetFavVendorsError(l));
      },
      (r) {
        if (r.data.isNotEmpty) {
          favVendorList.addAll(r.data);
          pageIndexForVendors++;
        } else {
          hasMoreVendors = false;
        }
        emit(GetFavVendorsSuccess(favVendorList));
      },
    );

    isLoadingVendors = false;
  }

  void removeFromFavoriteFood(int id) async {
    if (isClosed) return;
    emit(RemoveFavLoading());

    final result = await favRepo.removeFromFavoriteFood(id);
    if (isClosed) return;
    result.fold((error) => emit(RemoveFavError(error)), (r) {
      emit(RemoveFavSuccess());
      getFavFood();
    });
  }

  void removeFromFavoriteVendor(String id) async {
    if (isClosed) return;
    emit(RemoveFavVendorLoading());

    final result = await favRepo.removeFromFavoriteVendor(id);
    if (isClosed) return;
    result.fold((error) => emit(RemoveFavVendorError(error)), (r) {
      emit(RemoveFavVendorSuccess());
      getVendorFav();
    });
  }

  void changeIsFilterVisible(BuildContext context) {
    isFilterVisible = !isFilterVisible;
    if (isFilterVisible) {
      if (isFood) {
        BlocProvider.of<DiscoverCubit>(context).getCategories();
      } else {
        BlocProvider.of<DiscoverCubit>(context).getVendorTypes();
      }
    }
    emit(IsFilterVisible());
  }

  void changeIsExpanded() {
    isExpanded = !isExpanded;
    emit(IsExpanded());
  }

  void updateSort(String newTitle, String sortName) {
    title = newTitle;
    nameOfSort = sortName;
    isExpanded = false;
    serachFavController.clear();
    selectedSort = sortName;
    if (isFood) {
      getFavFood(
        isInitial: false,
        sort: sortName,
      );
      sortNameFood = title;
    } else {
      getVendorFav(
        loadingFromPagination: false,
        sort: sortName,
      );
      // getVendorDiscover(
      //   loadingFromPagination: false,
      //   sort: sortName,
      // );
      // sortNameVendor = title;
    }
    emit(UpdateSort());
  }

  void changeTap(int index) {
    isFood = index == 0;
    title = isFood ? sortNameFood : sortNameVendor;
    serachFavController.clear();
    if (isFood) {
      getFavFood(isInitial: false);
    } else {
      getVendorFav(loadingFromPagination: false);
    }
    emit(ChangeTap());
  }

  void dispose() {
    serachFavController.dispose();
    super.close();
  }
}
