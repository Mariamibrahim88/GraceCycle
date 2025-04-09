import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grace_cycle/core/service/service_locator.dart';
import 'package:grace_cycle/core/widgets/custom_list_of_shimmer_ver.dart';
import 'package:grace_cycle/core/widgets/custom_no_found_items.dart';
import 'package:grace_cycle/features/favorites/presentation/manager/cubit/get_fav_cubit.dart';
import 'package:grace_cycle/features/favorites/presentation/views/widgets/favorite_vendor_card.dart';

class FavVendorsList extends StatelessWidget {
  const FavVendorsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetFavCubit(sl())..getFavVendors(),
      child: BlocBuilder<GetFavCubit, GetFavState>(
        builder: (context, state) {
          if (state is GetFavVendorsLoading) {
            return const CustomListOfShimmerFavVer();
          } else if (state is GetFavVendorsSuccess) {
            if (state.favVendorModel.isEmpty) {
              return const CustomNoFoundItems(
                  title: 'No favorite vendors yet!');
            }
            return ListView.builder(
              itemCount: state.favVendorModel.length,
              itemBuilder: (context, index) => Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
                child: FavoriteVendorCard(
                  favVendorModel: state.favVendorModel[index],
                ),
              ),
            );
          }
          return const CustomListOfShimmerFavVer();
        },
      ),
    );
  }
}
