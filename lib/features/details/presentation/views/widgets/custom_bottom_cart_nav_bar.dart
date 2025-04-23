import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grace_cycle/core/utils/app_colors.dart';
import 'package:grace_cycle/core/utils/app_text_styles.dart';

class CustomBottomCartNavBar extends StatelessWidget {
  const CustomBottomCartNavBar({super.key});

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
        child: Container(
            height: 46.h,
            width: 344.w,
            decoration: BoxDecoration(
              color: AppColors.greenButt,
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Row(
                children: [
                  Text(
                    'Add to cart',
                    style: AppTextStyles.nunito600Size16White,
                  ),
                  const Spacer(),
                  Text('EGP 20', style: AppTextStyles.nunito600Size16White),
                ],
              ),
            )),
      ),
    );
  }
}
