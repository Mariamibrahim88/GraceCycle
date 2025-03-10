import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grace_cycle/features/home/data/models/food_menu_model.dart';
import 'package:grace_cycle/features/home/data/repos/home_repo.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.homeRepo) : super(HomeInitial());

  final HomeRepo homeRepo;

  Future<void> getFoodMenu() async {
    emit(HomeLoading());
    final response = await homeRepo.getFoodMenue();
    // print(response);

    response.fold(
      (l) => emit(HomeError(l)),
      (r) => emit(HomeSuccess(r)),
    );
  }
}
