import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grace_cycle/core/utils/app_colors.dart';

class CustomYellowText extends StatelessWidget {
  const CustomYellowText(
      {super.key, this.fontsize = 14, required this.text2, this.onPressed});

  final String text2;
  final double fontsize;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(text2,
          style: GoogleFonts.nunito(
              textBaseline: TextBaseline.alphabetic,
              fontSize: fontsize.sp,
              decoration: TextDecoration.underline,
              decorationColor: AppColors.yellow,
              decorationThickness: 2,
              decorationStyle: TextDecorationStyle.solid,
              fontWeight: FontWeight.w400,
              color: AppColors.yellow)),
    );
  }
}
