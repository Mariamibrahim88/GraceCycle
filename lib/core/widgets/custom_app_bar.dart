import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grace_cycle/core/utils/app_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.onPressed,
    this.title = '',
    this.fontStyle,
    this.color,
  });

  final void Function()? onPressed;
  final String? title;
  final Color? color;
  final double? fontStyle;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: preferredSize.height,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: IconButton(
              onPressed: onPressed,
              iconSize: 32,
              icon: const Icon(Icons.arrow_back_outlined),
              color: Colors.black,
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              title ?? '',
              textAlign: TextAlign.center,
              style: GoogleFonts.nunito(
                fontSize: fontStyle ?? 25.sp,
                fontWeight: FontWeight.w700,
                color: color ?? AppColors.greenButt,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
