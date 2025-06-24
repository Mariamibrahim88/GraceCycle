import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grace_cycle/core/routes/app_routes.dart';
import 'package:grace_cycle/core/utils/app_colors.dart';
import 'package:grace_cycle/core/utils/app_spacing.dart';
import 'package:grace_cycle/core/utils/app_text_styles.dart';

class CustomButtomNavBarFullCart extends StatelessWidget {
  const CustomButtomNavBarFullCart({
    super.key,
    required this.total,
    required this.count,
  });

  final double total;
  final int count;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 140.h,
      child: Container(
        decoration: const BoxDecoration(
          color: AppColors.basicWhite,
          borderRadius: BorderRadius.zero,
          //border:
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total ',
                    style: AppTextStyles.nunito600Size18GreenButt.copyWith(
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    '($count items)',
                    style: AppTextStyles.nunito400Size16Black,
                  ),
                  const Spacer(),
                  Text(
                    'EGP $total',
                    style: AppTextStyles.nunito700Size20Black,
                  ),
                ],
              ),
              verticalSpace(20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 36.h,
                    width: 150.w,
                    decoration: BoxDecoration(
                      color: AppColors.basicWhite,
                      borderRadius: BorderRadius.circular(16.r),
                      border: Border.all(
                        color: AppColors.greenButt,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'Add items',
                        style: AppTextStyles.nunito600Size16White.copyWith(
                          color: AppColors.greenButt,
                        ),
                      ),
                    ),
                  ),
                  horizontalSpace(10.w),
                  GestureDetector(
                    onTap: () {
                      // Handle checkout action here
                      // For example, navigate to the checkout page or perform any other action
                      Navigator.pushNamed(context, Routes.checkout);
                    },
                    child: Container(
                        height: 36.h,
                        width: 150.w,
                        decoration: BoxDecoration(
                          color: AppColors.greenButt,
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                        child: Center(
                          child: Text(
                            'Checkout',
                            style: AppTextStyles.nunito600Size16White,
                          ),
                        )),
                  ),
                ],
              ),
              verticalSpace(10.h),
            ],
          ),
        ),
      ),
    );
  }
}
