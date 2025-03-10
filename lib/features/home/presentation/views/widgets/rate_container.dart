import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grace_cycle/core/utils/app_colors.dart';

class RateContainer extends StatelessWidget {
  const RateContainer({super.key, required this.rate});

  final double rate;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 18.h,
      width: 46.w,
      decoration: BoxDecoration(
        color: AppColors.grayForSmallContainer,
        borderRadius: BorderRadius.circular(7),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.star,
            color: AppColors.yellowForStar,
            size: 20,
          ),
          Text(
            rate.toString(),
            style: GoogleFonts.nunito(
                color: Colors.black,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
