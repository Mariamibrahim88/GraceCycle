import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grace_cycle/core/utils/app_colors.dart';
import 'package:grace_cycle/core/utils/app_text_styles.dart';

class LeftContainer extends StatelessWidget {
  const LeftContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 50.w,
      top: 70.h,
      child: Container(
        height: 19.h,
        width: 58.w,
        decoration: BoxDecoration(
          color: AppColors.grayForSmallContainer,
          borderRadius: BorderRadius.circular(7),
        ),
        child: Center(
          child: Text(
            '5+ left',
            style: AppTextStyles.nunito500Size14Balck,
          ),
        ),
      ),
    );
  }
}
