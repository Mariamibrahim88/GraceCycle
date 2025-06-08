import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grace_cycle/core/utils/app_spacing.dart';
import 'package:grace_cycle/core/utils/app_text_styles.dart';
import 'package:grace_cycle/features/details/data/models/review_summary_model.dart';
import 'package:grace_cycle/features/details/presentation/views/widgets/custom_rating_bar.dart';

class CustomerReviewSection extends StatelessWidget {
  const CustomerReviewSection({
    super.key,
    required this.review,
  });

  final Review review;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 20.r,
              child: Image.asset(
                'assets/images/circle.jpg',
                fit: BoxFit.cover,
              ),
            ),
            horizontalSpace(10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  review.customerName,
                  style: AppTextStyles.nunito700Size16Black,
                ),
                verticalSpace(5),
                Row(
                  children: [
                    CustomRatingBar(
                      iconSize: 16,
                      initialRating: review.rating.toDouble(),
                      isReadOnly: true,
                    ),
                    horizontalSpace(5),
                    Text(
                      review.date,
                      style: AppTextStyles.nunito400Size14Black,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        Text(
          review.comment,
          style: AppTextStyles.nunito400Size14Black,
        ),
      ],
    );
  }
}
