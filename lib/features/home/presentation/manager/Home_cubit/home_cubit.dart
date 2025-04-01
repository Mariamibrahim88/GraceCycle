import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grace_cycle/features/home/data/repos/home_repo.dart';
import 'package:grace_cycle/features/home/presentation/manager/Home_cubit/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.homeRepo) : super(HomeInitial());

  final HomeRepo homeRepo;

  Future<void> getFoodMenu() async {
    emit(HomeLoading());
    final response = await homeRepo.getFoodMenue();
    // print(response);
    response.fold((l) => emit(HomeError(l)), (r) {
      if (!isClosed) {
        emit(HomeSuccess(r));
      }
    });
  }

  Future<void> getVendors() async {
    emit(HomeVendorLoading());
    final response = await homeRepo.getVendor();

    response.fold((l) => emit(HomeVendorError(l)), (r) {
      //if (!isClosed) {
      emit(HomeVendorSuccess(r));
      // }
    });
  }
}
