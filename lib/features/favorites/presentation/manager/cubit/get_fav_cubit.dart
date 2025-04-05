import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grace_cycle/features/favorites/data/models/fav_food_model.dart';
import 'package:grace_cycle/features/favorites/data/models/fav_vendor_model.dart';
import 'package:grace_cycle/features/favorites/data/repos/fav_repo.dart';

part 'get_fav_state.dart';

class GetFavCubit extends Cubit<GetFavState> {
  GetFavCubit(this.favRepo) : super(GetFavInitial());

  final FavRepo favRepo;

  void getFavFood() async {
    emit(GetFavLoading());

    final result = await favRepo.getFavouriteFood();
    result.fold(
        (error) => emit(GetFavError(error)), (r) => emit(GetFavSuccess(r)));
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
}
