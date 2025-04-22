import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grace_cycle/core/widgets/custom_list_of_shimmer_ver.dart';
import 'package:grace_cycle/core/widgets/custom_loading.dart';
import 'package:grace_cycle/features/favorites/presentation/manager/cubit/get_fav_cubit.dart';
import 'package:grace_cycle/features/favorites/presentation/views/widgets/custom_no_found_fav_items.dart';
import 'package:grace_cycle/features/favorites/presentation/views/widgets/favorite_food_card.dart';

class FavFoodList extends StatelessWidget {
  const FavFoodList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetFavCubit, GetFavState>(
      buildWhen: (previous, current) =>
          current is GetFavSuccess ||
          current is GetFavLoading ||
          current is FavFoodPaginationLoading ||
          current is GetFavError,
      builder: (context, state) {
        final getFavCubit = BlocProvider.of<GetFavCubit>(context);
        if (state is GetFavLoading && getFavCubit.allFavFoodItems.isEmpty) {
          return const CustomListOfShimmerFavVer();
        } else if (state is GetFavSuccess ||
            state is FavFoodPaginationLoading &&
                getFavCubit.allFavFoodItems.isNotEmpty) {
          return NotificationListener<ScrollNotification>(
            onNotification: (notification) {
              if (notification.metrics.pixels >=
                      notification.metrics.maxScrollExtent &&
                  notification is ScrollUpdateNotification &&
                  !getFavCubit.isLoadingMore) {
                getFavCubit.getFavFood(
                  isInitial: true,
                );
              }
              return false;
            },
            child: ListView.builder(
                itemCount: getFavCubit.allFavFoodItems.length + 1,
                itemBuilder: (context, index) {
                  if (index < getFavCubit.allFavFoodItems.length) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 12),
                      child: FavoriteFoodCard(
                        favFoodModel: getFavCubit.allFavFoodItems[index],
                      ),
                    );
                  } else {
                    if (getFavCubit.isLoadingMore) {
                      return const Center(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: CustomLoading(),
                        ),
                      );
                    } else if (!getFavCubit.hasMoreFood) {
                      if (getFavCubit.serachFavController.text.isNotEmpty &&
                          getFavCubit.allFavFoodItems.isEmpty) {
                        return SizedBox(
                          height: MediaQuery.of(context).size.height * 0.5,
                          child: const CustomNoFoundFavItems(
                            title: 'No Food Found',
                          ),
                        );
                      } else {
                        return const Center(
                          child: Text(
                            'No more foods',
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
        return const CustomListOfShimmerFavVer();
      },
    );
  }
}
