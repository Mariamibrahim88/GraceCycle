import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grace_cycle/core/utils/app_assets.dart';
import 'package:grace_cycle/core/utils/app_spacing.dart';
import 'package:grace_cycle/core/utils/app_text_styles.dart';
import 'package:grace_cycle/features/settings/presentation/views/widgets/custom_row_of_settings.dart';

class SectionOfAccountSettings extends StatelessWidget {
  const SectionOfAccountSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 10.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Account',
            style: AppTextStyles.nunito600Size18GreenButt,
          ),
          verticalSpace(20),
          CustomRowOfSettings(
            title: 'Edit Profile',
            iconPath: AppAssets.edit,
          ),
          verticalSpace(15.h),
          CustomRowOfSettings(
            title: 'Change Password',
            iconPath: AppAssets.changePass,
          ),
          verticalSpace(15.h),
          CustomRowOfSettings(
            title: 'Location',
            iconPath: AppAssets.location,
          ),
          verticalSpace(15.h),
          CustomRowOfSettings(
            title: 'Payment Methods',
            iconPath: AppAssets.payment,
          ),
        ],
      ),
    );
  }
}
