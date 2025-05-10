import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grace_cycle/core/utils/app_colors.dart';
import 'package:grace_cycle/core/utils/app_spacing.dart';

class ContainerOfIcon extends StatelessWidget {
  final String icon;
  final String text;
  final bool isActive;

  const ContainerOfIcon({
    super.key,
    required this.icon,
    required this.text,
    this.isActive = true,
  });

  @override
  Widget build(BuildContext context) {
    final Color borderColor =
        isActive ? AppColors.greentit : AppColors.grayForCheckout;
    final Color iconColor =
        isActive ? AppColors.greentit : AppColors.grayForCheckout;
    final Color textColor =
        isActive ? AppColors.greentit : AppColors.grayForCheckout;

    return Column(
      children: [
        Container(
            height: 45,
            width: 45,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14.r),
              border: Border.all(color: borderColor, width: 1.5),
            ),
            child: Center(
              child: SvgPicture.asset(
                icon,
                color: iconColor,
              ),
            )),
        verticalSpace(4),
        Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 12,
            color: textColor,
            height: 1.2,
          ),
        ),
      ],
    );
  }
}

Widget buildStepLine(bool isActive) {
  return Container(
    width: 40.w,
    height: 1.5,
    color: isActive ? AppColors.greentit : AppColors.grayForCheckout,
  );
}
