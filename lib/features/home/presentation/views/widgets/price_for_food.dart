import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grace_cycle/core/utils/app_colors.dart';
import 'package:grace_cycle/core/utils/app_spacing.dart';

class PriceForFood extends StatelessWidget {
  const PriceForFood(
      {super.key,
      required this.oldPrice,
      required this.newPrice,
      this.price = true});

  final double oldPrice;
  final double newPrice;
  final bool? price;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        price == false
            ? const SizedBox()
            : Text(
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
                    text: oldPrice.toString(),
                    style: TextStyle(fontSize: 14.sp),
                  ),
                ],
              ),
            ),
            horizontalSpace(10),
            RichText(
              text: TextSpan(
                style: const TextStyle(
                    color: AppColors.greenButt, fontWeight: FontWeight.bold),
                children: [
                  TextSpan(
                    text: "EGP",
                    style:
                        TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
                  ),
                  TextSpan(
                    text: newPrice.toString(),
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
