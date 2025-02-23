import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grace_cycle/core/utils/app_colors.dart';

class LeftPiecesContainer extends StatelessWidget {
  const LeftPiecesContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 19.h,
      width: 58.w,
      decoration: BoxDecoration(
        color: AppColors.grayForSmallContainer,
        borderRadius: BorderRadius.circular(7),
      ),
      child: Center(
        child: Text(
          '+5 left',
          style: GoogleFonts.nunito(
              color: Colors.black,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
