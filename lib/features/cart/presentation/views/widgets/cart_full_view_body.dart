import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grace_cycle/core/utils/app_spacing.dart';
import 'package:grace_cycle/core/widgets/custom_app_bar.dart';
import 'package:grace_cycle/features/cart/presentation/views/widgets/food_card_in_full_cart.dart';
import 'package:grace_cycle/features/cart/presentation/views/widgets/head_of_vendor_in_full_cart.dart';

class CartFullViewBody extends StatelessWidget {
  const CartFullViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.only(
          left: 12.w,
          right: 12.w,
          top: 22.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalSpace(30.h),
            CustomAppBar(
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            verticalSpace(5.h),
            const HeadOfVendorInFullCart(),
            verticalSpace(20.h),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 5,
              itemBuilder: (context, index) => const Padding(
                padding: EdgeInsets.only(
                  bottom: 16,
                ),
                child: FoodCardInfullCart(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
