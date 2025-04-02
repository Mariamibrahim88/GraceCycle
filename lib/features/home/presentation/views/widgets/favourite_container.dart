import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grace_cycle/core/utils/app_colors.dart';
import 'package:grace_cycle/features/home/data/models/food_menu_model.dart';
import 'package:grace_cycle/features/home/presentation/manager/Home_cubit/home_cubit.dart';
import 'package:grace_cycle/features/home/presentation/manager/Home_cubit/home_state.dart';

class FavouriteContainer extends StatelessWidget {
  const FavouriteContainer({super.key, required this.foodItem});

  final FoodItemModel foodItem;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) => current is HomeUpdateFavorites,
      builder: (context, state) {
        final homeCubit = BlocProvider.of<HomeCubit>(context);
        final isFavorite =
            homeCubit.favourites[foodItem.id] ?? foodItem.isFavourite;

        return Positioned(
          left: -2.w,
          top: 110.h,
          child: GestureDetector(
            onTap: () {
              homeCubit.toggleFoodFavorite(foodItem.id);
            },
            child: Container(
              height: 35.h,
              width: 35.w,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.grayForSmallContainer,
              ),
              child: Icon(
                Icons.favorite,
                color: isFavorite ? AppColors.greenButt : AppColors.grey3,
                size: 28.sp,
              ),
            ),
          ),
        );
      },
    );
  }
}
