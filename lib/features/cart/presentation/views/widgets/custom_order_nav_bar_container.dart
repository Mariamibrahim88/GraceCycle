import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grace_cycle/core/utils/app_colors.dart';
import 'package:grace_cycle/core/utils/app_spacing.dart';
import 'package:grace_cycle/core/utils/app_text_styles.dart';
import 'package:grace_cycle/features/orders/presentation/manager/cubit/checkout_cubit.dart';

class CustomOrderNavBarContainer extends StatelessWidget {
  const CustomOrderNavBarContainer(
      {super.key, required this.onTap, required this.text});

  final void Function()? onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    final checkoutCubit = BlocProvider.of<CheckoutCubit>(context);
    return Container(
      height: 152.h,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: AppColors.basicWhite,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            Row(
              children: [
                Text('Total', style: AppTextStyles.nunito600Size18Black),
                horizontalSpace(4),
                Text(
                  '(${checkoutCubit.totalNumberOfitems} items)',
                  style: AppTextStyles.nunito400Size16Black,
                ),
                const Spacer(),
                Text(
                  'EGP ${checkoutCubit.totalPrice}',
                  style: AppTextStyles.nunito700Size22Black,
                ),
              ],
            ),
            verticalSpace(20.h),
            GestureDetector(
              onTap: onTap,
              child: Container(
                  height: 46.h,
                  width: 344.w,
                  decoration: BoxDecoration(
                    color: AppColors.greenButt,
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  child: Center(
                    child:
                        Text(text, style: AppTextStyles.nunito600Size16White),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
