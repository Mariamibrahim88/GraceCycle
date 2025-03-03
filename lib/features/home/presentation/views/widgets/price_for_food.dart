import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grace_cycle/core/utils/app_colors.dart';
import 'package:grace_cycle/core/utils/app_spacing.dart';

class PriceForFood extends StatelessWidget {
  const PriceForFood({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Price',
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        Row(
          children: [
            RichText(
              text: TextSpan(
                style: const TextStyle(
                    decoration: TextDecoration.lineThrough,
                    decorationThickness: 1.5,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
                children: [
                  TextSpan(
                    text: "EGP",
                    style: TextStyle(fontSize: 12.sp),
                  ),
                  TextSpan(
                    text: "96",
                    style: TextStyle(fontSize: 14.sp),
                  ),
                ],
              ),
            ),
            horizontalSpace(10),
            RichText(
              text: TextSpan(
                style: const TextStyle(
                    color: AppColors.redForPrice, fontWeight: FontWeight.bold),
                children: [
                  TextSpan(
                    text: "EGP",
                    style:
                        TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
                  ),
                  TextSpan(
                    text: "150",
                    style:
                        TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
