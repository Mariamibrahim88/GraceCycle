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
      floating: true,
      expandedHeight: 60.h,
      pinned: false,
      backgroundColor: AppColors.basicWhite,
      flexibleSpace: FlexibleSpaceBar(
        background: SvgPicture.asset(
          AppAssets.background,
          fit: BoxFit.cover,
        ),
      ),
      title: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(
                Icons.menu,
                color: AppColors.shoppingCart,
                size: 28,
              ),
              Row(
                children: [
                  SizedBox(
                    height: 31.h,
                    width: 36.w,
                    child: SvgPicture.asset(AppAssets.smallAppLogo),
                  ),
                  SizedBox(width: 4.w),
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
      ),
    );
  }
}
