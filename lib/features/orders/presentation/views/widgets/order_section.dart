import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grace_cycle/core/utils/app_colors.dart';
import 'package:grace_cycle/core/utils/app_spacing.dart';
import 'package:grace_cycle/core/utils/app_text_styles.dart';
import 'package:grace_cycle/features/orders/presentation/views/widgets/list_of_food_in_checkout.dart';
import 'package:grace_cycle/features/orders/presentation/views/widgets/list_of_name_of_food_checkout.dart';

class OrderSection extends StatelessWidget {
  const OrderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
                    Text('EGP 20', style: AppTextStyles.nunito600Size18Black),
                  ],
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
