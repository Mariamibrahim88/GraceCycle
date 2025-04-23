import 'package:flutter/material.dart';
import 'package:grace_cycle/core/utils/app_spacing.dart';
import 'package:grace_cycle/core/utils/app_text_styles.dart';
import 'package:grace_cycle/features/details/presentation/views/widgets/custom_rating_bar.dart';

class RatingBarWidget extends StatelessWidget {
  const RatingBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          '4.5',
          style: AppTextStyles.nunito700Size32Black,
        ),
        verticalSpace(5),
        const CustomRatingBar(
          iconSize: 20,
          isReadOnly: true,
        ),
      ]),
    );
  }
}
