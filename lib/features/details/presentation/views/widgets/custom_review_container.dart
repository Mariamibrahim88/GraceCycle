import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grace_cycle/core/utils/app_colors.dart';
import 'package:grace_cycle/core/utils/app_spacing.dart';
import 'package:grace_cycle/core/utils/app_text_styles.dart';
import 'package:grace_cycle/features/details/presentation/views/widgets/yellow_title.dart';

class CustomReviewContainer extends StatelessWidget {
  const CustomReviewContainer({
    super.key,
    this.leftPadding,
    this.rightPadding,
    required this.title,
  });
  final double? leftPadding;
  final double? rightPadding;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 20.h,
        left: leftPadding ?? 25.w,
        right: rightPadding ?? 30.w,
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
                title: title,
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
              RatingBar(
                minRating: 0,
                maxRating: 5,
                glowColor: AppColors.grey,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: EdgeInsets.only(
                  left: 12.w,
                ),
                itemSize: 40.h,
                unratedColor: AppColors.grey,
                ratingWidget: RatingWidget(
                  full: const Icon(Icons.star, color: AppColors.yellowForStar),
                  half: const Icon(Icons.star_half,
                      color: AppColors.yellowForStar),
                  empty: const Icon(Icons.star_border, color: AppColors.grey),
                ),
                onRatingUpdate: (double value) {},
              ),
              verticalSpace(5.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: TextField(
                  style: AppTextStyles.nunito400Size14Black,
                  cursorColor: AppColors.greenButt,
                  maxLines: null,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Write your review here...',
                    hintStyle: const TextStyle(color: AppColors.grey3),
                    contentPadding: EdgeInsets.all(10.h),
                  ),
                ),
              ),
              verticalSpace(5.h),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.yellowForDetails,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    'Submit Review',
                    style: AppTextStyles.nunito600Size12White,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
