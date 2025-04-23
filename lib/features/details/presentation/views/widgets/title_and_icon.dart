import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grace_cycle/core/utils/app_colors.dart';
import 'package:grace_cycle/core/utils/app_text_styles.dart';

class TitleAndIcon extends StatelessWidget {
  const TitleAndIcon({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: AppTextStyles.nunito500Size14YellowDetails,
        ),
        const Spacer(),
        Icon(
          Icons.arrow_forward_ios,
          color: AppColors.yellowForDetails,
          size: 14.sp,
        ),
      ],
    );
  }
}
