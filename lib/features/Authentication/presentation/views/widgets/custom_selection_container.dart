import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grace_cycle/core/utils/app_colors.dart';

class CustomSelectionContainer extends StatelessWidget {
  const CustomSelectionContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 355.w,
      height: 45.h,
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.greenBorder),
          borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Selecte Health Conditions',
                  style: GoogleFonts.nunito(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.greentit)),
            ),
          ],
        ),
      ),
    );
  }
}
