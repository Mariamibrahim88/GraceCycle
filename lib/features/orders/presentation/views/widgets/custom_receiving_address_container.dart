import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grace_cycle/core/utils/app_colors.dart';
import 'package:grace_cycle/core/utils/app_spacing.dart';
import 'package:grace_cycle/core/utils/app_text_styles.dart';
import 'package:grace_cycle/features/orders/presentation/manager/cubit/checkout_cubit.dart';

class CustomReceivingAddressContainer extends StatelessWidget {
  const CustomReceivingAddressContainer(
      {super.key,
      required this.asset,
      required this.text,
      required this.index});

  final String asset;
  final String text;
  final int index;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckoutCubit, CheckoutState>(
      builder: (context, state) {
        final cubit = context.read<CheckoutCubit>();
        final isSelected = cubit.selectedIndex == index;
        return Container(
          height: 46.h,
          width: double.infinity,
          decoration: BoxDecoration(
            color: isSelected
                ? AppColors.greenButt.withOpacity(0.1)
                : AppColors.cardofCart,
            borderRadius: BorderRadius.circular(16.r),
            border: isSelected
                ? Border.all(color: AppColors.greenButt, width: 2)
                : null,
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: Row(
              children: [
                SvgPicture.asset(
                  asset,
                  colorFilter: const ColorFilter.mode(
                    AppColors.greenButt,
                    BlendMode.srcIn,
                  ),
                ),
                horizontalSpace(5),
                Text(
                  text,
                  style: isSelected
                      ? AppTextStyles.nunito400Size16GrayForOrders.copyWith(
                          color: AppColors.greenButt,
                          fontWeight: FontWeight.w600,
                        )
                      : AppTextStyles.nunito400Size16GrayForOrders,
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    cubit.isOrderPlaced(index);
                  },
                  child: Container(
                      alignment: Alignment.center,
                      height: 25.h,
                      width: 25.w,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColors.greenButt,
                          width: 2,
                        ),
                        shape: BoxShape.circle,
                      ),
                      child: isSelected
                          ? Container(
                              height: 15.h,
                              width: 15.w,
                              decoration: const BoxDecoration(
                                color: AppColors.greenButt,
                                shape: BoxShape.circle,
                              ),
                            )
                          : null),
                ),
                verticalSpace(5),
              ],
            ),
          ),
        );
      },
    );
  }
}
