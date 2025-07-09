import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grace_cycle/core/routes/app_routes.dart';
import 'package:grace_cycle/core/widgets/custom_loading.dart';
import 'package:grace_cycle/features/discover/presentation/views/widgets/custom_list_of_shimmer_ver.dart';
import 'package:grace_cycle/features/favorites/presentation/manager/cubit/get_fav_cubit.dart';
import 'package:grace_cycle/features/favorites/presentation/views/widgets/custom_no_found_fav_items.dart';
import 'package:grace_cycle/features/favorites/presentation/views/widgets/favorite_vendor_card.dart';

class FavVendorsList extends StatelessWidget {
  const FavVendorsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetFavCubit, GetFavState>(
      buildWhen: (previous, current) =>
          current is GetFavVendorsSuccess ||
          current is GetFavVendorsLoading ||
          current is FavVendorPaginationLoading ||
          current is GetFavVendorsError,
      builder: (context, state) {
        final favCubit = BlocProvider.of<GetFavCubit>(context);
        if (state is GetFavVendorsLoading && favCubit.favVendorList.isEmpty) {
          return const CustomListOfShimmerVer();
        } else if (state is GetFavVendorsSuccess ||
            (state is FavVendorPaginationLoading &&
                favCubit.favVendorList.isNotEmpty)) {
          if (favCubit.favVendorList.isEmpty &&
              favCubit.serachFavController.text.isEmpty) {
            return SizedBox(
              height: MediaQuery.of(context).size.height * 0.5,
              child: const CustomNoFoundFavItems(
                title: 'There are no favorites yet',
              ),
            );
          }
          return NotificationListener<ScrollNotification>(
            onNotification: (notification) {
              if (notification.metrics.pixels >=
                      notification.metrics.maxScrollExtent &&
                  notification is ScrollUpdateNotification &&
                  !favCubit.isLoadingVendors) {
                favCubit.getVendorFav(
                  loadingFromPagination: true,
                );
              }
              return false;
            },
            child: ListView.builder(
                itemCount: favCubit.favVendorList.length + 1,
                itemBuilder: (context, index) {
                  if (index < favCubit.favVendorList.length) {
                    return Padding(
                        padding: const EdgeInsets.only(
                          left: 20.0,
                          right: 10.0,
                          bottom: 8,
                          top: 8,
                        ),
                        child: GestureDetector(
                          onTap: () async {
                            await Navigator.pushNamed(
                              context,
                              Routes.vendorDetails,
                              arguments: favCubit.favVendorList[index].userId,
                            );
                            // Refresh favorites list when returning from vendor details
                            favCubit.getVendorFav(loadingFromPagination: false);
                          },
                          child: FavoriteVendorCard(
                            favVendorItem: favCubit.favVendorList[index],
                          ),
                        ));
                  } else {
                    if (favCubit.isLoadingVendors) {
                      return const Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 16),
                          child: CustomLoading(),
                        ),
                      );
                    } else if (!favCubit.hasMoreVendors) {
                      if (favCubit.serachFavController.text.isNotEmpty &&
                          favCubit.favVendorList.isEmpty) {
                        return SizedBox(
                          height: MediaQuery.of(context).size.height * 0.5,
                          child: const CustomNoFoundFavItems(
                            title: 'No Vendor Found',
                          ),
                        );
                      } else {
                        return const Center(
                          child: Text(
                            'No more vendors',
                            style: TextStyle(color: Colors.grey),
                          ),
                        );
                      }
                    } else {
                      return const SizedBox();
                    }
                  }
                }),
          );
        }
        return const CustomListOfShimmerVer();
      },
    );
  }
}
