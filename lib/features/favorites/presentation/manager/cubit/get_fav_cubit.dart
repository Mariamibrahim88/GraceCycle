import 'package:bloc/bloc.dart';
import 'package:grace_cycle/features/favorites/data/models/fav_food_model.dart';
import 'package:grace_cycle/features/favorites/data/models/fav_vendor_model.dart';
import 'package:grace_cycle/features/favorites/data/repos/fav_repo.dart';
import 'package:meta/meta.dart';

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
}
