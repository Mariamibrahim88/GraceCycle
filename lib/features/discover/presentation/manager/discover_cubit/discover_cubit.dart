import 'package:bloc/bloc.dart';
import 'package:grace_cycle/features/discover/data/repos/discover_repo.dart';
import 'package:grace_cycle/features/home/data/models/vendors_model.dart';
import 'package:meta/meta.dart';

part 'discover_state.dart';

class DiscoverCubit extends Cubit<DiscoverState> {
  DiscoverCubit(DiscoverRepo discoverRepo) : super(DiscoverInitial());
}
