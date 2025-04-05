import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grace_cycle/core/utils/app_colors.dart';
import 'package:grace_cycle/features/favorites/data/models/fav_food_model.dart';
import 'package:grace_cycle/features/favorites/presentation/manager/cubit/get_fav_cubit.dart';

class FavIconForFood extends StatelessWidget {
  const FavIconForFood({super.key, required this.foodItem});

  final FavFoodModel foodItem;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        BlocProvider.of<GetFavCubit>(context)
            .removeFromFavoriteFood(foodItem.id);
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
          color: AppColors.greenButt,
          size: 28.sp,
        ),
      ),
    );
  }
}
