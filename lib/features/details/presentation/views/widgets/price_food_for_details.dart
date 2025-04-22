import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grace_cycle/core/utils/app_colors.dart';
import 'package:grace_cycle/core/utils/app_spacing.dart';
import 'package:grace_cycle/core/utils/app_text_styles.dart';

class PriceFoodForDetails extends StatelessWidget {
  const PriceFoodForDetails(
      {super.key, required this.oldPrice, required this.newPrice});

  final double oldPrice;
  final double newPrice;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RichText(
          text: TextSpan(
            style: const TextStyle(
                decoration: TextDecoration.lineThrough,
                decorationThickness: 1.5,
                color: Colors.black,
                fontWeight: FontWeight.bold),
            children: [
              TextSpan(text: "EGP", style: AppTextStyles.nunito400Size12Black),
              TextSpan(
                text: oldPrice.toString(),
                style: AppTextStyles.nunito400Size16Black,
              ),
            ],
          ),
        ),
        horizontalSpace(7.w),
        RichText(
          text: TextSpan(
            style: const TextStyle(
                color: AppColors.greenButt, fontWeight: FontWeight.bold),
            children: [
              TextSpan(
                text: "EGP",
                style: AppTextStyles.nunito700Size16GreenButt,
              ),
              TextSpan(
                text: newPrice.toString(),
                style: AppTextStyles.nunito700Size20GreenButt,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
