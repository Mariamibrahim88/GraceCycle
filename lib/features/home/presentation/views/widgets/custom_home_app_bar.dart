import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grace_cycle/core/routes/app_routes.dart';
import 'package:grace_cycle/core/utils/app_assets.dart';
import 'package:grace_cycle/core/utils/app_colors.dart';
import 'package:grace_cycle/core/utils/app_navigate.dart';
import 'package:grace_cycle/features/cart/presentation/manager/cubit/cart_cubit.dart';
import 'package:grace_cycle/features/cart/presentation/manager/cubit/cart_state.dart';
import 'package:grace_cycle/features/cart/data/models/cart_items_for_any_vendor_model.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  int _getTotalCartItems(List<CartItemsForAnyVendorModel> cartItemsList) {
    int total = 0;
    for (var vendor in cartItemsList) {
      total += vendor.count.toInt();
    }
    return total;
  }

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
                child: SvgPicture.asset(
                  AppAssets.menu,
                  height: 16.h,
                  width: 16.w,
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
              BlocListener<CartCubit, CartState>(
                listener: (context, state) {
                  if (state is GetCartItemsForAnyVendorSuccess) {}
                },
                child: BlocBuilder<CartCubit, CartState>(
                  builder: (context, state) {
                    int cartItemsCount = 0;

                    if (state is GetCartItemsForAnyVendorSuccess) {
                      cartItemsCount =
                          _getTotalCartItems(state.cartItemsForAnyVendorList);
                    }

                    return GestureDetector(
                      onTap: () async {
                        final result = await Navigator.pushNamed(
                          context,
                          Routes.cart,
                        );

                        context.read<CartCubit>().getCartItemsForAnyVendor();
                      },
                      child: Stack(
                        children: [
                          SvgPicture.asset(
                            AppAssets.cart,
                            height: 22.h,
                            width: 22.w,
                          ),
                          if (cartItemsCount > 0)
                            Positioned(
                              left: -2.w,
                              bottom: -3.h,
                              child: Container(
                                padding: EdgeInsets.all(2.w),
                                decoration: BoxDecoration(
                                  color: AppColors.basicGreen,
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                                constraints: BoxConstraints(
                                  minWidth: 16.w,
                                  minHeight: 16.h,
                                ),
                                child: Text(
                                  cartItemsCount.toString(),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
