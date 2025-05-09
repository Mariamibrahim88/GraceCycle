import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grace_cycle/core/utils/app_colors.dart';
import 'package:grace_cycle/core/utils/app_spacing.dart';
import 'package:grace_cycle/core/utils/app_text_styles.dart';

class ContainerOfIcon extends StatelessWidget {
  const ContainerOfIcon({super.key, required this.icon, required this.text});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            width: 45.w,
            height: 45.h,
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColors.greenButt,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(14.r),
              //shape: BoxShape.circle,
              color: AppColors.basicWhite,
            ),
            child: Icon(
              icon,
              color: AppColors.greenButt,
              size: 30,
            )),
        verticalSpace(10),
        Text(
          text,
          style: AppTextStyles.nunito400Size16Black,
        ),
      ],
    );
  }
}
