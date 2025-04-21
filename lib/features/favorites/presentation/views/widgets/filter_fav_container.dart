import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grace_cycle/core/utils/app_colors.dart';
import 'package:grace_cycle/features/discover/presentation/views/widgets/vendor_expansion_tile.dart';
import 'package:grace_cycle/features/favorites/presentation/views/widgets/fav_food_expansion_tile.dart';

class FilterFavContainer extends StatelessWidget {
  const FilterFavContainer({super.key, required this.isFood});

  final bool isFood;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 70.h,
      right: 5.w,
      child: Container(
        width: 190.w,
        height: 500.h,
        padding: EdgeInsets.all(10.w),
        decoration: BoxDecoration(
          color: AppColors.basicWhite,
          borderRadius: BorderRadius.circular(15.r),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 5,
              spreadRadius: 2,
            ),
          ],
        ),
        child:
            isFood ? const FavFoodExpansionTile() : const VendorExpansionTile(),
      ),
    );
  }
}
