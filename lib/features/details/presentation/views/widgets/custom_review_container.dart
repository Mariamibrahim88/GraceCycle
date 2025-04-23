import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grace_cycle/core/utils/app_colors.dart';
import 'package:grace_cycle/core/utils/app_spacing.dart';
import 'package:grace_cycle/core/utils/app_text_styles.dart';
import 'package:grace_cycle/features/details/presentation/views/widgets/green_butt_text.dart';
import 'package:grace_cycle/features/details/presentation/views/widgets/yellow_title.dart';

class CustomReviewContainer extends StatelessWidget {
  const CustomReviewContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 20.h,
        left: 30.w,
        right: 30.w,
      ),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
            color: AppColors.yellowForDetails,
            width: 1.w,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(
            top: 10.h,
            bottom: 10.h,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              YellowTitle(
                title: 'Rate this vendor',
                leftPadding: 10.w,
              ),
              verticalSpace(5.h),
              Padding(
                padding: EdgeInsets.only(
                  left: 10.w,
                ),
                child: Text(
                  'Tell others what you think ',
                  style: AppTextStyles.nunito400Size14Black,
                ),
              ),
              verticalSpace(5.h),
              // RatingStars(
              //   valueLabelVisibility: false,
              //   axis: Axis.horizontal,
              //   starCount: 5,
              //   starSize: 37,
              //   starSpacing: 30.w,
              //   maxValue: 5,
              //   starOffColor: AppColors.grey,
              //   starColor: Colors.yellow,
              // ),
              verticalSpace(10.h),
              GreenButtText(
                text: 'Write a review',
                leftPadding: 10.w,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
