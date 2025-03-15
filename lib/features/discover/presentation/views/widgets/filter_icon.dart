import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grace_cycle/core/utils/app_assets.dart';

class FilterIcon extends StatelessWidget {
  const FilterIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 63.w,
      height: 42.h,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black.withOpacity(0.7)),
          borderRadius: BorderRadius.circular(15.r),
        ),
        child: Center(
          child: SvgPicture.asset(
            AppAssets.filter,
          ),
        ),
      ),
    );
  }
}
