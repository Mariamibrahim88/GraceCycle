import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grace_cycle/core/utils/app_colors.dart';

class LeftPiecesContainer extends StatelessWidget {
  const LeftPiecesContainer({super.key, required this.leftPieces, this.color});
  final String leftPieces;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 19.h,
      width: 58.w,
      decoration: BoxDecoration(
        color: color ?? AppColors.grayForSmallContainer,
        borderRadius: BorderRadius.circular(7),
      ),
      child: Center(
        child: Text(
          leftPieces,
          style: leftPieces == '0 left'
              ? GoogleFonts.nunito(
                  color: AppColors.redForPrice,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500)
              : GoogleFonts.nunito(
                  color: Colors.black,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
