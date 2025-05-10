import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grace_cycle/core/utils/app_assets.dart';
import 'package:grace_cycle/core/utils/app_colors.dart';
import 'package:grace_cycle/core/utils/app_spacing.dart';
import 'package:grace_cycle/core/utils/app_text_styles.dart';
import 'package:grace_cycle/features/order/presentation/views/widgets/back_home.dart';

class DoneOrderViewBody extends StatelessWidget {
  const DoneOrderViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(AppAssets.finished2),
            const SizedBox(height: 20),
            Text(
              'All Done!',
              style: AppTextStyles.nunito700Size22GreenButt.copyWith(
                color: Colors.black,
                fontSize: 24,
              ),
            ),
            verticalSpace(50.h),
            Container(
                width: double.infinity,
                height: 35.h,
                decoration: BoxDecoration(
                  color: AppColors.greenButt,
                  borderRadius: BorderRadius.circular(15.r),
                ),
                child: Center(
                  child: Text(
                    'Done',
                    style: AppTextStyles.nunito700Size16Black.copyWith(
                      color: AppColors.basicWhite,
                      fontSize: 20.sp,
                    ),
                    textAlign: TextAlign.center,
                  ),
                )),
            verticalSpace(25.h),
            const BackHome(),
            verticalSpace(25.h),
          ],
        ),
      ),
    );
  }
}
