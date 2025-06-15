import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grace_cycle/core/utils/app_colors.dart';

class ShimmerContainer extends StatelessWidget {
  final double height;
  final double width;
  final BorderRadius? borderRadius;

  const ShimmerContainer({
    super.key,
    required this.height,
    required this.width,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: AppColors.grey,
          borderRadius: borderRadius ?? BorderRadius.circular(8.r),
        ),
      ),
    );
  }
}

class FoodDetailsShimmerBody extends StatelessWidget {
  const FoodDetailsShimmerBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ShimmerContainer(
            height: 220.h,
            width: double.infinity,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30.r),
              bottomRight: Radius.circular(30.r),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ShimmerContainer(height: 14.h, width: 80.w),
                SizedBox(height: 8.h),
                ShimmerContainer(height: 20.h, width: 180.w),
                SizedBox(height: 12.h),
                ShimmerContainer(height: 16.h, width: 120.w),
                SizedBox(height: 20.h),
                ShimmerContainer(height: 16.h, width: 70.w),
                SizedBox(height: 10.h),
                ShimmerContainer(height: 16.h, width: 100.w),
                SizedBox(height: 10.h),
                ShimmerContainer(height: 16.h, width: double.infinity),
                SizedBox(height: 20.h),
                ShimmerContainer(height: 14.h, width: 100.w),
                SizedBox(height: 10.h),
                ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => Row(
                    children: [
                      ShimmerContainer(
                          height: 40.h,
                          width: 40.h,
                          borderRadius: BorderRadius.circular(50.r)),
                      SizedBox(width: 12.w),
                      Expanded(
                          child: ShimmerContainer(
                              height: 16.h, width: double.infinity)),
                    ],
                  ),
                  separatorBuilder: (context, index) => SizedBox(height: 10.h),
                  itemCount: 3,
                ),
                SizedBox(height: 20.h),
                ShimmerContainer(
                    height: 40.h,
                    width: double.infinity,
                    borderRadius: BorderRadius.circular(10.r)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
