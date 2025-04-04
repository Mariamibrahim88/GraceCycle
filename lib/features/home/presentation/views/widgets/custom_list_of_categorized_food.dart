import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grace_cycle/core/widgets/custom_list_of_shimmer_hor.dart';
import 'package:grace_cycle/features/home/presentation/manager/Home_cubit/home_state.dart';
import 'package:grace_cycle/features/home/presentation/views/widgets/custom_list_of_food_hor.dart';

import '../../manager/Home_cubit/home_cubit.dart';

class ListOfCategorizedFood extends StatelessWidget {
  const ListOfCategorizedFood({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
          current is HomeSuccess ||
          current is HomeUpdateFavorites ||
          current is HomeLoading,
      builder: (context, state) {
        final homeCubit = BlocProvider.of<HomeCubit>(context);
        final foodMenuModel = homeCubit.foodMenuModel;
        if (state is HomeLoading && foodMenuModel == null) {
          return const CustomListOfShimmerHor();
        }

        if (foodMenuModel == null) {
          return const SizedBox();
        }

        return SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h),
            child: Column(
              children: foodMenuModel.categories.entries.map((foodItemList) {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                  child: CustomListOfFoodHor(
                    categoryTitle: foodItemList.key,
                    foodItemModel: foodItemList.value,
                  ),
                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }
}
