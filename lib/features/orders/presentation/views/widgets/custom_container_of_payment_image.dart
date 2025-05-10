import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grace_cycle/core/utils/app_colors.dart';

class CustomContainerOfPaymentImage extends StatelessWidget {
  const CustomContainerOfPaymentImage({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 71.w,
      height: 46.h,
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.grayForCheckout,
          width: 3,
        ),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Center(child: SvgPicture.asset(image)),
    );
  }
}
