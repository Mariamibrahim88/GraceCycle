import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grace_cycle/core/utils/app_colors.dart';
import 'package:grace_cycle/core/utils/app_spacing.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    //this.padding = const EdgeInsets.only(top: 45.0, left: 2.0),
    required this.onPressed,
    this.title = ' ',
    this.color,
  });
  final void Function()? onPressed;
  final String? title;
  final Color? color;
  // final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: onPressed,
          padding: const EdgeInsets.all(18),
          iconSize: 32,
          icon: const Icon(
            Icons.arrow_back_outlined,
          ),

          // return AppBar(
          //   clipBehavior: Clip.none,
          //   elevation: 0,
          //   backgroundColor: Colors.transparent,
          //   leading: IconButton(
          //       onPressed: onPressed,
          //       // padding: const EdgeInsets.all(0),
          //       iconSize: 32,
          //       icon: const Icon(
          //         Icons.arrow_back_outlined,
          //       )),
          // Padding(
          //   padding: padding,
          //   child: GestureDetector(
          //     child: const Icon(
          //       Icons.arrow_back_outlined,
          //       size: 32,
          //     ),
          //   ),
          // ),
        ),
        horizontalSpace(52.w),
        Text(title ?? '',
            style: GoogleFonts.nunito(
              fontSize: 25.sp,
              fontWeight: FontWeight.w700,
              color: color ?? AppColors.greenButt,
            )),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
