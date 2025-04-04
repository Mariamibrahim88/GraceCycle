import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grace_cycle/core/utils/app_spacing.dart';
import 'package:grace_cycle/core/utils/app_text_styles.dart';

class CustomRowOfSettings extends StatelessWidget {
  const CustomRowOfSettings({
    super.key,
    required this.title,
    required this.iconPath,
    this.textColor = Colors.black,
    this.iconFound = true,
  });

  final String title;
  final String iconPath;
  final Color textColor;
  final bool iconFound;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(iconPath),
        horizontalSpace(15.w),
        Text(
          title,
          style: AppTextStyles.nunito400Size16Black.copyWith(
            color: textColor,
          ),
        ),
        const Spacer(),
        iconFound
            ? const Icon(
                Icons.arrow_forward_ios_rounded,
                size: 18,
              )
            : const SizedBox.shrink(),
      ],
    );
  }
}
