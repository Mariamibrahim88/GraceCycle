import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grace_cycle/features/home/data/models/food_menu_model.dart';
import 'package:grace_cycle/features/home/data/models/vendors_model.dart';
import 'package:grace_cycle/features/home/data/repos/home_repo.dart';
import 'package:grace_cycle/features/home/presentation/manager/Home_cubit/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.homeRepo) : super(HomeInitial());

  final HomeRepo homeRepo;
  final Map<int, bool> favourites = {};
  final Map<String, bool> favouritesForVendors = {};

  FoodMenuModel? foodMenuModel;
  VendorsModel? vendorsModel;

  Future<void> getFoodMenu() async {
    emit(HomeLoading());
    final response = await homeRepo.getFoodMenue();

    response.fold(
      (l) => emit(HomeError(l)),
      (r) {
        foodMenuModel = r;
        favourites.clear();
        final allFoodItems =
            r.categories.entries.expand((entry) => entry.value).toList();
        allFoodItems.forEach((food) {
          favourites[food.id] = food.isFavourite;
        });
        emit(HomeSuccess(r));
      },
    );
  }

  Future<void> getVendors() async {
    emit(HomeVendorLoading());
    final response = await homeRepo.getVendor();
    response.fold((l) => emit(HomeVendorError(l)), (r) {
      vendorsModel = r;
      favouritesForVendors.clear();
      final allVendors =
          r.vendors.entries.expand((entry) => entry.value).toList();
      allVendors.forEach((vendor) {
        favouritesForVendors[vendor.userId] = vendor.isFavourite;
      });
      emit(HomeVendorSuccess(r));
    });
  }

  Future<void> toggleFoodFavorite(int id) async {
    final isCurrentlyFavorite = favourites[id] ?? false;
    favourites[id] = !isCurrentlyFavorite;
    emit(HomeUpdateFavorites());

    if (isCurrentlyFavorite) {
      final response = await homeRepo.removeFromFavoriteFood(id);
      response.fold(
        (l) {
          favourites[id] = true;
          emit(HomeError(l));
        },
        (r) {
          favourites[id] = false;
          emit(HomeUpdateFavorites());
        },
      );
    } else {
      final response = await homeRepo.addToFavoriteFood(id);
      response.fold(
        (l) {
          favourites[id] = false;
          emit(HomeError(l));
        },
        (r) {
          favourites[id] = true;
          emit(HomeUpdateFavorites());
        },
      );
    }
  }

  Future<void> toggleVendorFavorite(String id) async {
    final isCurrentlyFavoriteVendor = favouritesForVendors[id] ?? false;
    favouritesForVendors[id] = !isCurrentlyFavoriteVendor;
    emit(HomeUpdateVendorFavorites());

    if (isCurrentlyFavoriteVendor) {
      final response = await homeRepo.removeFromFavoriteVendor(id);
      response.fold(
        (l) {
          favouritesForVendors[id] = true;
          emit(HomeVendorError(l));
        },
        (r) {
          favouritesForVendors[id] = false;
          emit(HomeUpdateVendorFavorites());
        },
      );
    } else {
      final response = await homeRepo.addToFavoriteVendor(id);
      response.fold(
        (l) {
          favouritesForVendors[id] = false;
          emit(HomeVendorError(l));
        },
        (r) {
          favouritesForVendors[id] = true;
          emit(HomeUpdateVendorFavorites());
        },
      );
    }
  }
}
