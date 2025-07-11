import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grace_cycle/core/utils/app_colors.dart';
import 'package:grace_cycle/core/utils/app_spacing.dart';

class RecommendationReasonBadge extends StatelessWidget {
  final String reason;
  final double score;

  const RecommendationReasonBadge({
    super.key,
    required this.reason,
    required this.score,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 8.h,
      left: 8.w,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
        decoration: BoxDecoration(
          color: AppColors.basicGreen.withOpacity(0.9),
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.auto_awesome,
              color: Colors.white,
              size: 12.sp,
            ),
            horizontalSpace(4.w),
            Text(
              reason,
              style: TextStyle(
                color: Colors.white,
                fontSize: 10.sp,
                fontWeight: FontWeight.w500,
                fontFamily: 'Nunito',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
