import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  CustomButton(
      {super.key,
      this.image,
      required this.text,
      required this.onPressed,
      required this.textColor,
      required this.color});

  String text;
  Color color;
  Color textColor;
  String? image;
  void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 355.w,
        height: 45.h,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (image != null) ...[
              SvgPicture.asset(
                image!,
                width: 17.w,
                height: 17.h,
              ),
              SizedBox(width: 10.w), // Spacing between image and text
            ],
            Text(
              text,
              style: GoogleFonts.nunito(
                color: textColor,
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
