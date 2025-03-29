import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grace_cycle/core/utils/app_colors.dart';

class FavouriteRestaurantContainer extends StatelessWidget {
  const FavouriteRestaurantContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 15.w,
      bottom: 80.h,
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
