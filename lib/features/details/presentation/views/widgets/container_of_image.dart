import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grace_cycle/core/utils/app_assets.dart';
import 'package:grace_cycle/core/utils/app_colors.dart';

class ContainerOfImage extends StatelessWidget {
  const ContainerOfImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.vendorCard,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30.r),
          bottomRight: Radius.circular(30.r),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(top: 40.h),
        child: SizedBox(
          height: 323.h,
          width: 161.w,
          child: Image.asset(
            AppAssets.baked2,
          ),
        ),
      ),
    );
  }
}
