import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grace_cycle/core/utils/app_colors.dart';

class DiscountContainer extends StatelessWidget {
  const DiscountContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 10,
      top: 88.h,
      child: Container(
        height: 43.h,
        width: 43.w,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.greenForDiscount,
        ),
        child: Center(
          child: Text(
            '-20%',
            style: GoogleFonts.nunito(
                color: Colors.black,
                fontSize: 15.sp,
                fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
