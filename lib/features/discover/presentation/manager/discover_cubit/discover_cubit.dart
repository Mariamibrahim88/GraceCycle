import 'package:bloc/bloc.dart';
import 'package:grace_cycle/features/discover/data/models/vendors_discover_model.dart';
import 'package:grace_cycle/features/discover/data/repos/discover_repo.dart';
import 'package:meta/meta.dart';

part 'discover_state.dart';

class DiscoverCubit extends Cubit<DiscoverState> {
  DiscoverCubit(this.discoverRepo) : super(DiscoverInitial());
  final DiscoverRepo discoverRepo;

  // int pageIndex = 1;
  // int pageSize = 10;

  Future<void> getVendorDiscover(
      {required int pageIndex,
      required int pageSize,
      int? vendorTypeId,
      String? sort,
      String? search,
      isLoadMore = false}) async {
    emit(DiscoverVendorLoading());
    final response = await discoverRepo.getVendorDiscover(
      pageSize: pageSize,
      pageIndex: pageIndex,
      sort: sort,
      vendorTypeId: vendorTypeId,
      search: search,
    );
  
    
    response.fold(
      (l) => emit(DiscoverVendorFailure(l)),
      (vendorsModel) {
        emit(DiscoverVendorSuccess(
          vendorsModel,
        ));
      },
    );
  }
}
