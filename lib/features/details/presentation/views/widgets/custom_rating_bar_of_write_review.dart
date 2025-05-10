import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grace_cycle/core/utils/app_colors.dart';

class CustomRatingBarOfWriteReview extends StatelessWidget {
  const CustomRatingBarOfWriteReview({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RatingBar(
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
        half: const Icon(Icons.star_half, color: AppColors.yellowForStar),
        empty: const Icon(Icons.star_border, color: AppColors.grey),
      ),
      onRatingUpdate: (double value) {},
    );
  }
}
