import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grace_cycle/core/utils/app_colors.dart';

class QuestionText extends StatelessWidget {
  const QuestionText({super.key, required this.text1, required this.text2});

  final String text1;
  final String text2;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(text1,
            style: GoogleFonts.nunito(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.greensubtit)),
        TextButton(
          onPressed: () {},
          child: Text(text2,
              style: GoogleFonts.nunito(
                  textBaseline: TextBaseline.alphabetic,
                  fontSize: 14.sp,
                  //but line under text
                  decoration: TextDecoration.underline,
                  decorationColor: AppColors.yellow,
                  //decorationThickness: 2,
                  decorationStyle: TextDecorationStyle.solid,
                  fontWeight: FontWeight.w400,
                  color: AppColors.yellow)),
        ),
      ],
    );
  }
}
