import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grace_cycle/core/utils/app_colors.dart';
import 'package:grace_cycle/core/utils/app_text_styles.dart';

class DiscountContainerForDetails extends StatelessWidget {
  const DiscountContainerForDetails({super.key, required this.discount});

  final int discount;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 145.h,
      right: 50.w,
      child: Container(
        height: 43.h,
        width: 43.w,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.greenForDiscount,
        ),
        child: Center(
          child: Text('$discount%', style: AppTextStyles.nunito700Size15Black),
        ),
      ),
    );
  }
}
