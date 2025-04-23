import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grace_cycle/core/utils/app_colors.dart';

class CustomRatingBar extends StatelessWidget {
  final double iconSize;
  final bool isReadOnly;
  final double initialRating;
  final void Function(double)? onRatingUpdate;

  const CustomRatingBar({
    super.key,
    required this.iconSize,
    this.isReadOnly = true,
    this.initialRating = 2.5,
    this.onRatingUpdate,
  });

  @override
  Widget build(BuildContext context) {
    return isReadOnly
        ? RatingBarIndicator(
            rating: initialRating,
            itemBuilder: (context, index) => const Icon(
              Icons.star,
              color: AppColors.yellowForStar,
            ),
            itemCount: 5,
            itemSize: iconSize.sp,
            unratedColor: AppColors.grey3,
          )
        : RatingBar(
            initialRating: initialRating,
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemSize: iconSize.sp,
            unratedColor: AppColors.grey3,
            ratingWidget: RatingWidget(
              full: const Icon(Icons.star, color: AppColors.yellowForStar),
              half: const Icon(Icons.star_half, color: AppColors.yellowForStar),
              empty: const Icon(Icons.star_border, color: AppColors.grey3),
            ),
            onRatingUpdate: onRatingUpdate ?? (rating) {},
          );
  }
}
