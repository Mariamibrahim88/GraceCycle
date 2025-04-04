import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grace_cycle/core/utils/app_assets.dart';
import 'package:grace_cycle/core/utils/app_colors.dart';
import 'package:grace_cycle/core/utils/app_spacing.dart';
import 'package:grace_cycle/core/utils/app_text_styles.dart';
import 'package:grace_cycle/features/settings/presentation/views/widgets/custom_row_of_settings.dart';

class SectionOfSupportSettings extends StatelessWidget {
  const SectionOfSupportSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 10.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Support',
            style: AppTextStyles.nunito600Size18GreenButt,
          ),
          verticalSpace(20),
          CustomRowOfSettings(
            title: 'Customer Support',
            iconPath: AppAssets.customer,
          ),
          verticalSpace(15.h),
          CustomRowOfSettings(
            title: 'Privacy Policy',
            iconPath: AppAssets.changePass,
          ),
          verticalSpace(15.h),
          CustomRowOfSettings(
            title: 'Terms and Conditions',
            iconPath: AppAssets.location,
          ),
          verticalSpace(15.h),
          CustomRowOfSettings(
            title: 'Log Out',
            iconFound: false,
            textColor: AppColors.redForPrice,
            iconPath: AppAssets.logOut,
          ),
        ],
      ),
    );
  }
}
