import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grace_cycle/features/discover/data/models/vendors_type_model.dart';
import 'package:grace_cycle/features/discover/data/models/get_categories_model.dart';
import 'package:grace_cycle/features/discover/data/repos/discover_repo.dart';
import 'package:grace_cycle/features/home/data/models/food_menu_model.dart';
import 'package:grace_cycle/features/home/data/models/vendors_model.dart';
part 'discover_state.dart';

class DiscoverCubit extends Cubit<DiscoverState> {
  DiscoverCubit(this.discoverRepo) : super(DiscoverInitial());
  final DiscoverRepo discoverRepo;

  int _pageIndex = 1;
  int pageIndexForVendors = 1;
  bool isLoadingMore = false;
  bool isLoadingVendors = false;
  List<FoodItemModel> allFoodItems = [];
  TextEditingController serachController = TextEditingController();
  String? selectedSort;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  List<VendorItemModel> vendorList = [];
  bool isFilterVisible = false;
  bool isExpanded = false;
  bool isFood = true;
  String? nameOfSort;
  String? title;
  String? sortNameFood;
  String? sortNameVendor;
  bool hasMoreVendors = true;
  bool hasMoreFood = true;
  List<VendorsTypeModel> vendorTypes = [];
  int? selectedVendorTypeId;
  int? selectedCategoryId;
  int? selectedMaxPrice;

  // int pgeIndex = 1;

  Future<void> getVendorDiscover({
    bool loadingFromPagination = false,
    int pageSize = 10,
    int? vendorTypeId,
    String? sort,
    String? search,
  }) async {
    //if (isLoadingVendors) return;

    if (loadingFromPagination) {
      emit(DiscoverVendorPaginationLoading());
    } else {
      pageIndexForVendors = 1;
      vendorList.clear();
      emit(DiscoverVendorLoading());
    }

    isLoadingVendors = true;

    final response = await discoverRepo.getVendorDiscover(
      pageIndexForVendors,
      vendorTypeId ?? selectedVendorTypeId,
      pageSize,
      sort ?? selectedSort,
      search ?? serachController.text,
    );

    response.fold(
      (l) {
        emit(DiscoverVendorFailure(l));
      },
      (r) {
        if (r.data.isNotEmpty) {
          vendorList.addAll(r.data);
          pageIndexForVendors++;
        } else {
          hasMoreVendors = false;
        }
        emit(DiscoverVendorSuccess(vendorList));
      },
    );

    isLoadingVendors = false;

    // if (loadingFromPagination) {
    //   pageIndexForVendors = 1;
    //   vendorList.clear();
    //   emit(DiscoverVendorLoading());
    // }
    // if (isLoadingVendors) return;
    // isLoadingVendors = true;
    // if (pageIndexForVendors == 1) emit(DiscoverVendorLoading());
    // final response = await discoverRepo.getVendorDiscover(
    //   pageIndexForVendors,
    //   vendorTypeId,
    //   pageSize,
    //   sort ?? selectedSort,
    //   search ?? serachController.text,
    // );

    // response.fold(
    //   (l) {
    //     emit(DiscoverVendorFailure(l));
    //   },
    //   (r) {
    //     if (r.data.isNotEmpty) {
    //       vendorList.addAll(r.data);
    //       pageIndexForVendors++;
    //       emit(DiscoverVendorSuccess(vendorList));
    //     } else {
    //       emit(DiscoverVendorSuccess(vendorList));
    //     }
    //   },
    // );
    // isLoadingVendors = false;
  }

  // Future<void> getFoodDiscover(
  //     {bool isInitial = false,
  //     int pageSize = 10,
  //     int? categoryId,
  //     int? maxPrice,
  //     String? sort,
  //     String? search}) async {
  //   if (isInitial) {
  //     _pageIndex = 1;
  //     allFoodItems.clear();
  //     emit(DiscoverFoodLoading());
  //   }

  //   if (isLoadingMore) return;

  //   isLoadingMore = true;
  //   if (_pageIndex == 1) emit(DiscoverFoodLoading());
  //   final result = await discoverRepo.getFoodDiscover(
  //       _pageIndex,
  //       pageSize,
  //       categoryId ?? selectedCategoryId,
  //       maxPrice ?? selectedMaxPrice,
  //       sort ?? selectedSort,
  //       search ?? serachController.text);

  //   result.fold((ifLeft) => emit(DiscoverFoodFailure(ifLeft)), (ifRight) {
  //     if (ifRight.data.isNotEmpty) {
  //       allFoodItems.addAll(ifRight.data);
  //       _pageIndex++;

  //       emit(DiscoverFoodSuccess(allFoodItems));
  //     } else {
  //       emit(DiscoverFoodSuccess(allFoodItems));
  //     }
  //   });
  //   isLoadingMore = false;
  // }
  Future<void> getFoodDiscover(
      {bool isInitial = false,
      int pageSize = 10,
      int? categoryId,
      int? maxPrice,
      String? sort,
      String? search}) async {
    if (isInitial) {
      // _pageIndex = 1;
      // allFoodItems.clear();
      emit(DiscoverFoodPaginationLoading());
    } else {
      _pageIndex = 1;
      allFoodItems.clear();
      emit(DiscoverFoodLoading());
    }

    // if (isLoadingMore) return;

    isLoadingMore = true;
    // if (_pageIndex == 1) emit(DiscoverFoodLoading());
    final result = await discoverRepo.getFoodDiscover(
        _pageIndex,
        pageSize,
        categoryId ?? selectedCategoryId,
        maxPrice ?? selectedMaxPrice,
        sort ?? selectedSort,
        search ?? serachController.text);

    result.fold((ifLeft) => emit(DiscoverFoodFailure(ifLeft)), (ifRight) {
      if (ifRight.data.isNotEmpty) {
        allFoodItems.addAll(ifRight.data);
        _pageIndex++;

        // emit(DiscoverFoodSuccess(allFoodItems));
      } else {
        hasMoreFood = false;
      }
      emit(DiscoverFoodSuccess(allFoodItems));
    });
    isLoadingMore = false;
  }

  void changeIsFilterVisible() {
    isFilterVisible = !isFilterVisible;
    if (isFilterVisible) {
      if (isFood) {
        getCategories();
      } else {
        getVendorTypes();
      }
    }
    emit(IsFilterVisible());
  }

  void changeIsExpanded() {
    isExpanded = !isExpanded;
    emit(IsExpanded());
  }

  void changeTap(int index) {
    isFood = index == 0;
    title = isFood ? sortNameFood : sortNameVendor;
    serachController.clear();
    if (isFood) {
      getFoodDiscover(isInitial: false);
    } else {
      getVendorDiscover(loadingFromPagination: false);
    }
    emit(ChangeTap());
  }

  void updateSort(String newTitle, String sortName) {
    title = newTitle;
    nameOfSort = sortName;
    isExpanded = false;
    serachController.clear();
    selectedSort = sortName;
    if (isFood) {
      getFoodDiscover(
        isInitial: false,
        sort: sortName,
      );
      sortNameFood = title;
    } else {
      getVendorDiscover(
        loadingFromPagination: false,
        sort: sortName,
      );
      sortNameVendor = title;
    }
    emit(UpdateSort());
  }

  Future<void> getVendorTypes() async {
    emit(VendorTypesLoading());
    final response = await discoverRepo.getVendorTypes();

    response.fold(
      (l) {
        emit(VendorTypesFailure(l));
      },
      (r) {
        emit(VendorTypesSucess(r));
      },
    );
  }

  Future<void> getCategories() async {
    emit(GetCategoriesLoading());
    final response = await discoverRepo.getCategories();
    response.fold(
      (l) => emit(GetCategoriesFailure(l)),
      (r) => emit(GetCategoriesSuccess(r)),
    );
  }

  void dispose() {
    serachController.dispose();
    super.close();
  }
}
