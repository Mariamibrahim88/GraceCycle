import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grace_cycle/core/utils/app_colors.dart';
import 'package:grace_cycle/features/Authentication/presentation/views/widgets/custom_yellow_text.dart';

class QuestionText extends StatelessWidget {
  QuestionText(
      {super.key, required this.text1, required this.text2, this.onPressed});

  final String text1;
  final String text2;
  Function()? onPressed;

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
        CustomYellowText(text2: text2, onPressed: onPressed),
      ],
    );
  }
}
