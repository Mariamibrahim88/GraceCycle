import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grace_cycle/core/utils/app_colors.dart';
import 'package:grace_cycle/core/utils/app_text_styles.dart';

class YellowTitle extends StatelessWidget {
  const YellowTitle({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 30.w),
      child: Text(
        title,
        style: AppTextStyles.nunito700Size16GreenButt.copyWith(
          color: AppColors.yellowForDetails,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
