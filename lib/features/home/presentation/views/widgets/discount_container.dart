import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grace_cycle/core/utils/app_colors.dart';

class DiscountContainer extends StatelessWidget {
  const DiscountContainer({super.key, required this.discount, required this.fontSize});

  final int discount;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 43.h,
      width: 43.w,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.greenForDiscount,
      ),
      child: Center(
        child: Text(
          '$discount%',
          style: GoogleFonts.nunito(
              color: Colors.black,
              fontSize: fontSize,
              fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}
