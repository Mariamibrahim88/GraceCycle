import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grace_cycle/core/utils/app_colors.dart';
import 'package:grace_cycle/core/utils/app_text_styles.dart';
import 'package:grace_cycle/core/widgets/custom_app_bar.dart';
import 'package:grace_cycle/features/cart/presentation/views/widgets/container_of_icon.dart';
import 'package:grace_cycle/features/cart/presentation/views/widgets/head_of_vendor_in_full_cart.dart';
import 'package:grace_cycle/features/cart/presentation/views/widgets/list_of_food_in_checkout.dart';
import 'package:grace_cycle/features/cart/presentation/views/widgets/list_of_name_of_food_checkout.dart';

import '../../../../../core/utils/app_spacing.dart';

class CheckoutViewBody extends StatelessWidget {
  const CheckoutViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
        child: Column(
          children: [
            CustomAppBar(onPressed: () {
              Navigator.pop(context);
            }),
            verticalSpace(5.h),
            const HeadOfVendorInFullCart(),
            verticalSpace(20.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                children: [
                  const Expanded(
                    child: Column(
                      children: [
                        ContainerOfIcon(
                          text: 'Order \n',
                          icon: Icons.shopping_cart_outlined,
                        ),
                      ],
                    ),
                  ),
                  //line
                  Container(
                    alignment: Alignment.center,
                    width: 60.w,
                    child: Container(
                      height: 2.h,
                      color: AppColors.greentit,
                    ),
                  ),
                  const Expanded(
                    child: Column(
                      children: [
                        ContainerOfIcon(
                          text: 'Receiving \nmethod',
                          icon: Icons.location_on_outlined,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: 60.w,
                    child: Container(
                      height: 2.h,
                      color: AppColors.greentit,
                    ),
                  ),
                  const Expanded(
                    child: Column(
                      children: [
                        ContainerOfIcon(
                          text: 'Payment\n method',
                          icon: Icons.payment_outlined,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            verticalSpace(20.h),
            const ListOfFoodInCheckout(),
            verticalSpace(20.h),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Order summary',
                    style: AppTextStyles.nunito700Size22GreenButt),
                verticalSpace(15.h),
                const ListOfNameOfFoodCheckout(),
                verticalSpace(5.h),
                Container(
                  height: 41.h,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: AppColors.cardofCart,
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    child: Row(
                      children: [
                        Text('Total savings',
                            style: AppTextStyles.nunito600Size18Black),
                        const Spacer(),
                        Text('EGP 20',
                            style: AppTextStyles.nunito600Size18Black),
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
