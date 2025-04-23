import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grace_cycle/core/utils/app_colors.dart';
import 'package:grace_cycle/core/utils/app_spacing.dart';
import 'package:grace_cycle/core/utils/app_text_styles.dart';

class RemoveAndAddCartItem extends StatelessWidget {
  const RemoveAndAddCartItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            //context.read<DetailsCubit>().calculateTotalPrice();
          },
          child: Container(
            height: 18.h,
            width: 21.w,
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColors.greenButt,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(6.r),
            ),
            child: const Icon(
              Icons.remove,
              color: AppColors.greenButt,
              size: 20,
            ),
          ),
        ),
        horizontalSpace(10.w),
        Text(
          '1',
          style: AppTextStyles.nunito700Size16Black,
        ),
        horizontalSpace(10.w),
        GestureDetector(
          onTap: () {
            //context.read<DetailsCubit>().calculateTotalPrice();
          },
          child: Container(
            height: 18.h,
            width: 21.w,
            decoration: BoxDecoration(
              color: AppColors.greenButt,
              borderRadius: BorderRadius.circular(6.r),
            ),
            child: const Icon(
              Icons.add,
              color: Colors.white,
              size: 20,
            ),
          ),
        ),
      ],
    );
  }
}
