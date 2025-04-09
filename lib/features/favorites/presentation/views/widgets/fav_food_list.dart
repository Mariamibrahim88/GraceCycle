import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grace_cycle/core/widgets/custom_list_of_shimmer_ver.dart';
import 'package:grace_cycle/core/widgets/custom_no_found_items.dart';
import 'package:grace_cycle/features/favorites/presentation/manager/cubit/get_fav_cubit.dart';
import 'package:grace_cycle/features/favorites/presentation/views/widgets/favorite_food_card.dart';

class FavFoodList extends StatelessWidget {
  const FavFoodList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetFavCubit, GetFavState>(
      builder: (context, state) {
        if (state is GetFavLoading) {
          return const CustomListOfShimmerFavVer();
        } else if (state is GetFavSuccess) {
          if (state.favfoodModel.isEmpty) {
            return const CustomNoFoundItems(title: 'No favorite foods yet!');
          }
          return ListView.builder(
            itemCount: state.favfoodModel.length,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
              child: FavoriteFoodCard(
                favFoodModel: state.favfoodModel[index],
              ),
            ),
          );
        }
        return const CustomListOfShimmerFavVer();
      },
    );
  }
}
