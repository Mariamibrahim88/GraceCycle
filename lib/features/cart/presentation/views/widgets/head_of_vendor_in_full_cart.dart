import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grace_cycle/core/utils/app_colors.dart';
import 'package:grace_cycle/core/utils/app_spacing.dart';
import 'package:grace_cycle/core/utils/app_text_styles.dart';

class HeadOfVendorInFullCart extends StatelessWidget {
  const HeadOfVendorInFullCart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16,
      ),
      child: Row(
        children: [
          Text(
            'Your Cart',
            style: AppTextStyles.nunito400Size16Black.copyWith(
              color: AppColors.grey4,
            ),
          ),
          horizontalSpace(5.w),
          const Icon(
            Icons.keyboard_double_arrow_right_sharp,
            size: 22,
            color: AppColors.grey4,
          ),
          horizontalSpace(5.w),
          Text(
            'All shall',
            style: AppTextStyles.nunito400Size16Black.copyWith(
              color: AppColors.grey4,
            ),
          ),
        ],
      ),
    );
  }
}
