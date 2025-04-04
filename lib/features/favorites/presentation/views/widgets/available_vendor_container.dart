// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grace_cycle/core/utils/app_colors.dart';
import 'package:grace_cycle/core/utils/app_spacing.dart';

class AvailableVendorContainer extends StatelessWidget {
  const AvailableVendorContainer(
      {super.key, this.color, required this.available});

  final Color? color;
  final String available;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Container(
        height: 19.h,
        width: 130.w,
        decoration: BoxDecoration(
          color: color ?? AppColors.grayForSmallContainer,
          borderRadius: BorderRadius.circular(7),
        ),
        child: Center(
          child: Text(
            available,
            style: available == 'No items available'
                ? GoogleFonts.nunito(
                    color: AppColors.redForPrice,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500)
                : GoogleFonts.nunito(
                    color: AppColors.available,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
