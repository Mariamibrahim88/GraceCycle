import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grace_cycle/core/utils/app_colors.dart';

class CustomYellowText extends StatelessWidget {
  CustomYellowText({super.key, required this.text2, this.onPressed});

  final String text2;
  Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(text2,
          style: GoogleFonts.nunito(
              textBaseline: TextBaseline.alphabetic,
              fontSize: 14.sp,
              decoration: TextDecoration.underline,
              decorationColor: AppColors.yellow,
              decorationThickness: 2,
              decorationStyle: TextDecorationStyle.solid,
              fontWeight: FontWeight.w400,
              color: AppColors.yellow)),
    );
  }
}
