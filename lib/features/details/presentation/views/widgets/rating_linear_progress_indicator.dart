import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grace_cycle/core/utils/app_colors.dart';
import 'package:grace_cycle/core/utils/app_text_styles.dart';

class RatingLinearProgressIndicator extends StatelessWidget {
  const RatingLinearProgressIndicator({
    super.key,
    required this.oneStar,
    required this.twoStar,
    required this.threeStar,
    required this.fourStar,
    required this.fiveStar,
    required this.totalReviews,
  });

  final int oneStar;
  final int twoStar;
  final int threeStar;
  final int fourStar;
  final int fiveStar;
  final int totalReviews;

  @override
  Widget build(BuildContext context) {
    double getRatio(int count) {
      if (totalReviews == 0) return 0.0;
      return count / totalReviews;
    }

    final Map<int, double> ratings = {
      5: getRatio(fiveStar),
      4: getRatio(fourStar),
      3: getRatio(threeStar),
      2: getRatio(twoStar),
      1: getRatio(oneStar),
    };

    return Expanded(
      child: Column(
        children: ratings.entries.map((entry) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: Row(
              children: [
                SizedBox(
                  width: 16,
                  child: Text(
                    '${entry.key}',
                    style: AppTextStyles.nunito700Size16Black,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: LinearProgressIndicator(
                    value: entry.value.clamp(0.0, 1.0),
                    minHeight: 10,
                    borderRadius: BorderRadius.circular(10.r),
                    backgroundColor: Colors.grey[300],
                    valueColor: const AlwaysStoppedAnimation<Color>(
                      AppColors.greenButt,
                    ),
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
