import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grace_cycle/core/widgets/custom_loading.dart';
import 'package:grace_cycle/core/widgets/custom_no_found_items.dart';
import 'package:grace_cycle/features/discover/presentation/manager/discover_cubit/discover_cubit.dart';
import 'package:grace_cycle/features/discover/presentation/views/widgets/custom_list_of_shimmer_ver.dart';
import 'package:grace_cycle/features/home/presentation/views/widgets/food_card.dart';

class FoodDiscoverList extends StatelessWidget {
  const FoodDiscoverList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DiscoverCubit, DiscoverState>(
      buildWhen: (previous, current) =>
          current is DiscoverFoodSuccess ||
          current is DiscoverFoodLoading ||
          current is DiscoverFoodPaginationLoading ||
          current is DiscoverFoodFailure,
      builder: (context, state) {
        final discoverCubit = BlocProvider.of<DiscoverCubit>(context);
        if (state is DiscoverFoodLoading &&
            discoverCubit.allFoodItems.isEmpty) {
          return const CustomListOfShimmerVer();
        } else if (state is DiscoverFoodSuccess ||
            state is DiscoverFoodPaginationLoading &&
                discoverCubit.allFoodItems.isNotEmpty) {
          return NotificationListener<ScrollNotification>(
            onNotification: (notification) {
              if (notification.metrics.pixels >=
                      notification.metrics.maxScrollExtent &&
                  notification is ScrollUpdateNotification &&
                  !discoverCubit.isLoadingMore) {
                discoverCubit.getFoodDiscover(
                  isInitial: true,
                );
              }
              return false;
            },
            child: ListView.builder(
                // shrinkWrap: true,
                itemCount: discoverCubit.allFoodItems.length + 1,
                itemBuilder: (context, index) {
                  if (index < discoverCubit.allFoodItems.length) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 12),
                      child: FoodCard(
                        foodItemModel: discoverCubit.allFoodItems[index],
                      ),
                    );
                  } else {
                    if (discoverCubit.isLoadingMore) {
                      return const Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 16),
                          child: CustomLoading(),
                        ),
                      );
                    } else if (!discoverCubit.hasMoreFood) {
                      if (discoverCubit.serachController.text.isNotEmpty &&
                          discoverCubit.allFoodItems.isEmpty) {
                        return SizedBox(
                          height: MediaQuery.of(context).size.height * 0.5,
                          child: const CustomNoFoundItems(
                            title: 'No foods found!',
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
        return const CustomListOfShimmerVer();
      },
    );
  }
}
