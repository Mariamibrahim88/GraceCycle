import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grace_cycle/core/routes/app_routes.dart';
import 'package:grace_cycle/core/utils/app_assets.dart';
import 'package:grace_cycle/core/utils/app_colors.dart';
import 'package:grace_cycle/core/utils/app_navigate.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      elevation: 0,
      floating: true,
      expandedHeight: 80.h,
      pinned: false,
      snap: true,
      clipBehavior: Clip.none,
      backgroundColor: AppColors.basicWhite,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        background: SvgPicture.asset(
          AppAssets.background,
          fit: BoxFit.cover,
        ),
      ),
      title: Center(
        child: Padding(
          padding: EdgeInsets.only(top: 40.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  navigate(context: context, route: Routes.settings);
                },
                child: const Icon(
                  Icons.menu,
                  color: AppColors.shoppingCart,
                  size: 28,
                ),
              ),
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
              GestureDetector(
                child: const Icon(
                  Icons.shopping_cart_outlined,
                  color: AppColors.shoppingCart,
                  size: 28,
                ),
                onTap: () {
                  navigate(context: context, route: Routes.cart);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
