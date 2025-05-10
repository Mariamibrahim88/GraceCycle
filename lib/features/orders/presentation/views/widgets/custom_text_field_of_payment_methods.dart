import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grace_cycle/core/utils/app_colors.dart';

class CustomTextFieldOfPaymentMethods extends StatelessWidget {
  const CustomTextFieldOfPaymentMethods(
      {super.key, required this.height, required this.width});

  final int height;
  final int width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height.h,
      width: width.w,
      child: TextFormField(
        cursorColor: AppColors.greenButt,
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.cardofCart,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(16.r),
          ),
          contentPadding:
              EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        ),
      ),
    );
  }
}
