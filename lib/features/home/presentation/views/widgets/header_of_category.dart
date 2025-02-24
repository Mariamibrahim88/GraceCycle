import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grace_cycle/core/utils/app_colors.dart';
import 'package:grace_cycle/features/Authentication/presentation/views/widgets/custom_yellow_text.dart';

class HeadOfCategory extends StatelessWidget {
  const HeadOfCategory({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: GoogleFonts.nunito(
            fontSize: 20.sp,
            fontWeight: FontWeight.w700,
            color: AppColors.greenButt,
          ),
        ),
        const CustomYellowText(
          text2: 'See all',
          fontsize: 18,
          fontWeight: FontWeight.w700,
        )
      ],
    );
  }
}
