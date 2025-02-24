import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grace_cycle/core/utils/app_assets.dart';
import 'package:grace_cycle/core/utils/app_colors.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      elevation: 0,
      expandedHeight: kToolbarHeight,
      floating: true,
      pinned: false,
      backgroundColor: AppColors.basicWhite,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: EdgeInsets.zero,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SizedBox(
                  height: 31.h,
                  width: 36.w,
                  child: SvgPicture.asset(AppAssets.smallAppLogo),
                ),
                SvgPicture.asset(
                  AppAssets.appName,
                  height: 14.h,
                  width: 85.w,
                ),
              ],
            ),
            const Icon(
              Icons.shopping_cart_outlined,
              color: AppColors.shoppingCart,
              size: 28,
            ),
          ],
        ),
      ),
    );
  }
}
