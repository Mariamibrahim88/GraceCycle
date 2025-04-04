import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grace_cycle/core/utils/app_colors.dart';
import 'package:grace_cycle/core/utils/app_spacing.dart';
import 'package:grace_cycle/core/utils/app_text_styles.dart';

class SortByContainer extends StatelessWidget {
  const SortByContainer({
    super.key,
    required this.isExpanded,
  });

  final bool isExpanded;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('Sort by:',
            style: AppTextStyles.nunito400Size16Black),
        horizontalSpace(5),
        Container(
          height: 25.h,
          width: 110.w,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              color: AppColors.sortColor,
              border: Border.all(
                color: AppColors.greensubtit,
              ),
              boxShadow: const [
                BoxShadow(
                  color: AppColors.secondgreenItself,
                  blurRadius: 2,
                  offset: Offset(0, 2),
                ),
              ]),
          child: Row(
            children: [
              Icon(
                isExpanded
                    ? Icons.keyboard_arrow_up
                    : Icons.keyboard_arrow_down,
                color: isExpanded
                    ? AppColors.greenButt
                    : Colors.black,
              ),
              Center(
                child: Text(
                  'Food Rating',
                  textAlign: TextAlign.center,
                  style: isExpanded
                      ? AppTextStyles.nunito500Size14Black
                          .copyWith(
                          color: AppColors.greenButt,
                        )
                      : AppTextStyles.nunito500Size14Black,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
