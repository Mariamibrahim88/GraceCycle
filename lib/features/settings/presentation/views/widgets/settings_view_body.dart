import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grace_cycle/core/widgets/custom_app_bar.dart';
import 'package:grace_cycle/features/settings/presentation/views/widgets/section_of_account_settings.dart';
import 'package:grace_cycle/features/settings/presentation/views/widgets/section_of_support_settings.dart';

class SettingsViewBody extends StatelessWidget {
  const SettingsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.only(
          left: 12.w,
          right: 12.w,
          top: 22.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppBar(
              title: 'Settings',
              fontStyle: 22.sp,
              color: Colors.black,
              onPressed: () => Navigator.pop(context),
            ),
            const SectionOfAccountSettings(),
            const SectionOfSupportSettings(),
          ],
        ),
      ),
    );
  }
}
