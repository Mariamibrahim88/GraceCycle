import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grace_cycle/core/utils/app_text_styles.dart';

class GreenButtText extends StatelessWidget {
  const GreenButtText({
    super.key, required this.text, required this.leftPadding,
  });
  final String text ;
  final double leftPadding ;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: leftPadding),
      child: Text(
       text,
        style: AppTextStyles.nunito600Size18GreenButt.copyWith(
          fontSize: 14.sp,
        ),
      ),
    );
  }
}
