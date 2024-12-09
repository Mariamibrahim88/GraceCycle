import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grace_cycle/core/utils/app_colors.dart';

class OrSection extends StatelessWidget {
  const OrSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Expanded(
          child: Divider(
            color: AppColors.greensubtit,
            thickness: 1,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
          child: Text('OR',
              style: GoogleFonts.nunito(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.greensubtit)),
        ),
        const Expanded(
          child: Divider(
            color: AppColors.greensubtit,
            thickness: 1,
          ),
        ),
      ],
    );
  }
}
