import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grace_cycle/core/utils/app_colors.dart';
import 'package:grace_cycle/core/utils/app_spacing.dart';
import 'package:grace_cycle/core/utils/app_text_styles.dart';

class ContainerVendorIconDataDetails extends StatelessWidget {
  const ContainerVendorIconDataDetails({
    super.key,
    required this.icon,
    required this.text,
  });
  final IconData icon;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        horizontalSpace(20.w),
        Icon(
          icon,
          color: AppColors.basicGreen,
          size: 30,
        ),
        horizontalSpace(10.w),
        Text(
          text,
          style: AppTextStyles.nunito500Size16Black,
        ),
      ],
    );
  }
}
