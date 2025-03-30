import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grace_cycle/core/widgets/custom_shimmer_card.dart';

class CustomListOfShimmerHor extends StatelessWidget {
  const CustomListOfShimmerHor({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 20.h),
        child: Row(
          children: List.generate(
            4,
            (index) => Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: const CustomShimmerCard(),
            ),
          ),
        ),
      ),
    );
  }
}
