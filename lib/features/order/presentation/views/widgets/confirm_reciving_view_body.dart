import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grace_cycle/core/routes/app_routes.dart';
import 'package:grace_cycle/core/utils/app_assets.dart';
import 'package:grace_cycle/core/utils/app_colors.dart';
import 'package:grace_cycle/core/utils/app_spacing.dart';
import 'package:grace_cycle/core/utils/app_text_styles.dart';
import 'package:grace_cycle/features/order/presentation/views/widgets/back_home.dart';
import 'package:swipe_to/swipe_to.dart';

class ConfirmRecivingViewBody extends StatefulWidget {
  const ConfirmRecivingViewBody({super.key});

  @override
  State<ConfirmRecivingViewBody> createState() =>
      _ConfirmRecivingViewBodyState();
}

class _ConfirmRecivingViewBodyState extends State<ConfirmRecivingViewBody> {
  bool _swiped = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(image: AssetImage(AppAssets.finished1)),
            const SizedBox(height: 20),
            Text(
              'congratulations!',
              style: AppTextStyles.nunito700Size22GreenButt.copyWith(
                fontSize: 24,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Your order has been successfully\naccepted. Please swipe the button if\nyou have already received it',
              style: AppTextStyles.nunito400Size14Black.copyWith(
                color: AppColors.grey4,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 50.h),
            _swiped
                ? GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        Routes.doneOrder,
                      );
                    },
                    child: Container(
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
                  )
                : Container(
                    width: double.infinity,
                    height: 35.h,
                    decoration: BoxDecoration(
                      color: AppColors.greenSwipe,
                      borderRadius: BorderRadius.circular(15.r),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text('swipe if you receive',
                              style: AppTextStyles.nunito700Size16Black),
                        ),
                        const Spacer(),
                        SwipeTo(
                          onLeftSwipe: (details) {
                            setState(() {
                              _swiped = true;
                            });
                          },
                          offsetDx: 5,
                          animationDuration: const Duration(milliseconds: 1),
                          child: Container(
                            width: 55.w,
                            height: 35.h,
                            decoration: BoxDecoration(
                              color: AppColors.greenButt,
                              borderRadius: BorderRadius.circular(15.r),
                              border: Border.all(
                                color: Colors.black,
                                width: 2.w,
                              ),
                            ),
                            child: const Icon(
                              Icons.arrow_back_sharp,
                              color: AppColors.basicWhite,
                              size: 30,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
            verticalSpace(25.h),
            const BackHome(),
            
          ],
        ),
      ),
    );
  }
}
