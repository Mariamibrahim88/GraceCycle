import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grace_cycle/core/utils/app_colors.dart';
import 'package:grace_cycle/core/utils/app_text_styles.dart';
import 'package:grace_cycle/core/widgets/custom_loading.dart';
import 'package:grace_cycle/features/discover/presentation/manager/discover_cubit/discover_cubit.dart';
import 'package:grace_cycle/features/discover/presentation/views/widgets/list_tile_item_of_filter.dart';
import 'package:grace_cycle/features/favorites/presentation/manager/cubit/get_fav_cubit.dart';

class FavVendorExpansionTile extends StatelessWidget {
  const FavVendorExpansionTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(
        'Vendor Types',
        style: AppTextStyles.nunito700Size18Black,
      ),
      children: [
        BlocBuilder<DiscoverCubit, DiscoverState>(
          builder: (context, state) {
            if (state is VendorTypesLoading) {
              return const Center(child: CustomLoading());
            } else if (state is VendorTypesSucess) {
              return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: state.vendorTypes.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      child: ListTileItemOfFilter(
                        title: state.vendorTypes[index].type,
                      ),
                      onTap: () {
                        final cubit = BlocProvider.of<GetFavCubit>(context);

                        cubit.selectedVendorTypeId =
                            state.vendorTypes[index].id;

                        cubit.getVendorFav(
                          loadingFromPagination: false,
                        );
                        cubit.changeIsFilterVisible(
                          context,
                        );
                      },
                    );
                  });
            } else if (state is VendorTypesFailure) {
              return Center(
                child: Text(
                  state.errorMessage,
                  style: AppTextStyles.nunito400Size16Black.copyWith(
                    color: AppColors.redForPrice,
                  ),
                ),
              );
            } else {
              return const SizedBox();
            }
          },
        ),
        // ListTileItemOfFilter(title: 'Healthy'),
        // ListTileItemOfFilter(title: ('Dessert')),
        // ListTileItemOfFilter(title: ('Baked Goods')),
        // ListTileItemOfFilter(title: ('Drinks')),
      ],
    );
  }
}
