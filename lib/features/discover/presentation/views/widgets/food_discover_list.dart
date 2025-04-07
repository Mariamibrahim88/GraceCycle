import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
          current is DiscoverFoodSuccess || current is DiscoverFoodLoading,
      builder: (context, state) {
        if (state is DiscoverFoodLoading) {
          return const CustomListOfShimmerVer();
        } else if (state is DiscoverFoodSuccess) {
          return NotificationListener<ScrollNotification>(
            onNotification: (notification) {
              if (notification.metrics.pixels ==
                      notification.metrics.maxScrollExtent &&
                  notification is ScrollUpdateNotification) {
                DiscoverCubit cubit = BlocProvider.of(context);
                cubit.getFoodDiscover(
                  isInitial: false,
                );
              }
              return true;
            },
            child: state.discoverFoodModel.isEmpty
                ? const CustomNoFoundItems(title: 'No food found!')
                : ListView.builder(
                    key: const PageStorageKey('foodList'),
                    itemCount: state.discoverFoodModel.length,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 12),
                      child: FoodCard(
                        foodItemModel: state.discoverFoodModel[index],
                      ),
                    ),
                  ),
          );
        }
        return const CustomListOfShimmerVer();
      },
    );
  }
}
