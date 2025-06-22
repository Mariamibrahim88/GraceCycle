import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grace_cycle/core/utils/app_colors.dart';
import 'package:grace_cycle/core/utils/app_text_styles.dart';

class LeftPiecesContainer extends StatelessWidget {
  const LeftPiecesContainer({super.key, required this.leftPieces, this.color});
  final int leftPieces;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 19.h,
      width: 58.w,
      decoration: BoxDecoration(
        color: color ?? AppColors.grayForSmallContainer,
        borderRadius: BorderRadius.circular(7),
      ),
      child: Center(
        child: Text(
          '$leftPieces +left',
          style: leftPieces == 0
              ? AppTextStyles.nunito500Size14Red
              : AppTextStyles.nunito500Size14Balck,
        ),
      ),
    );
  }
}
