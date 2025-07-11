import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grace_cycle/core/utils/app_colors.dart';

class HeadOfCategory extends StatelessWidget {
  const HeadOfCategory({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              if (title == 'Recommended for You')
                Icon(
                  Icons.recommend,
                  color: AppColors.greenButt,
                  size: 20.sp,
                ),
              if (title == 'Recommended for You') SizedBox(width: 8.w),
              Text(
                title,
                style: GoogleFonts.nunito(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.greenButt,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
