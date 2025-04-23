import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grace_cycle/core/utils/app_colors.dart';
import 'package:grace_cycle/core/utils/app_text_styles.dart';

class RatingLinearProgressIndicator extends StatelessWidget {
  RatingLinearProgressIndicator({super.key});

  final Map<int, double> ratings = {
    5: 0.8,
    4: 0.5,
    3: 0.2,
    2: 0.1,
    1: 0.05,
  };

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: ratings.entries.map((entry) {
          return Row(
            children: [
              SizedBox(
                  width: 10,
                  child: Text(
                    '${entry.key}',
                    style: AppTextStyles.nunito700Size16Black,
                  )),
              const SizedBox(width: 8),
              Expanded(
                child: LinearProgressIndicator(
                  value: entry.value,
                  minHeight: 10,
                  borderRadius: BorderRadius.circular(10.r),
                  backgroundColor: Colors.grey[300],
                  valueColor:
                      const AlwaysStoppedAnimation<Color>(AppColors.greenButt),
                ),
              ),
            ],
          );
        }).toList(),
      ),
    );
  }
}
