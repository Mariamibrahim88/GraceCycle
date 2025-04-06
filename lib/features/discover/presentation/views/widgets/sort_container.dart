import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grace_cycle/core/utils/app_colors.dart';

class SortContainer extends StatelessWidget {
  const SortContainer({
    super.key,
    required this.isFood,
    required this.sortOptions,
  });
  final bool isFood;
  final List<Widget> sortOptions;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 100.h,
      right: 120.w,
      left: 75.w,
      child: Container(
        width: 193.w,
        height: 177.h,
        decoration: BoxDecoration(
          color: AppColors.basicWhite,
          borderRadius: BorderRadius.circular(15.r),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 5,
              spreadRadius: 2,
            ),
          ],
        ),
        child: SingleChildScrollView(
          child: Column(children: sortOptions),
        ),
      ),
    );
  }
}
