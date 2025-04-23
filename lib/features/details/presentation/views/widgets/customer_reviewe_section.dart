import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grace_cycle/core/utils/app_spacing.dart';
import 'package:grace_cycle/core/utils/app_text_styles.dart';
import 'package:grace_cycle/features/details/presentation/views/widgets/custom_rating_bar.dart';

class CustomerReviewSection extends StatelessWidget {
  const CustomerReviewSection({
    super.key,
  });

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
                  'Ola Ahmed',
                  style: AppTextStyles.nunito700Size16Black,
                ),
                verticalSpace(5),
                Row(
                  children: [
                    const CustomRatingBar(
                      iconSize: 16,
                      isReadOnly: true,
                    ),
                    horizontalSpace(5),
                    Text(
                      '25/2/25',
                      style: AppTextStyles.nunito400Size14Black,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        Text(
          'I dont understand why people like this bread. Its too sour, and the texture is rubbery yuou ldjhv dnbhfj lkhnb ',
          style: AppTextStyles.nunito400Size14Black,
        ),
      ],
    );
  }
}
