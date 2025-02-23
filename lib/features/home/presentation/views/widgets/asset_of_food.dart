import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grace_cycle/core/utils/app_assets.dart';

class AssetOfFood extends StatelessWidget {
  const AssetOfFood({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.vertical(top: Radius.circular(15.r)),
      child: SizedBox(
        height: 137.h,
        width: 278.w,
        child: Image.asset(
          AppAssets.recommendedFood,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
