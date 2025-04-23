import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grace_cycle/core/utils/app_colors.dart';
import 'package:grace_cycle/core/utils/app_spacing.dart';
import 'package:grace_cycle/core/utils/app_text_styles.dart';

class CustomButtomNavBarFullCart extends StatelessWidget {
  const CustomButtomNavBarFullCart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 90.h,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.basicWhite,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
          ),
        ),
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
                  '(5 items)',
                  style: AppTextStyles.nunito400Size16Black,
                ),
                const Spacer(),
                Text(
                  'EGP 20',
                  style: AppTextStyles.nunito700Size20Black,
                ),
              ],
            ),
            verticalSpace(6.h),
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
                Container(
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
              ],
            ),
            verticalSpace(10.h),
          ],
        ),
      ),
    );
  }
}
