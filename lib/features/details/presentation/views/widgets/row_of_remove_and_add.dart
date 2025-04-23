import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grace_cycle/core/utils/app_colors.dart';
import 'package:grace_cycle/core/utils/app_spacing.dart';
import 'package:grace_cycle/core/utils/app_text_styles.dart';
import 'package:grace_cycle/features/details/presentation/manager/cubit/details_cubit.dart';

class RowOfRemoveAndAdd extends StatelessWidget {
  const RowOfRemoveAndAdd({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailsCubit, DetailsState>(
      builder: (context, state) {
        return Row(
          children: [
            GestureDetector(
              onTap: () {
                context.read<DetailsCubit>().decreaseQuantity();
                //context.read<DetailsCubit>().calculateTotalPrice();
              },
              child: Container(
                height: 30.h,
                width: 30.w,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColors.greenButt,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(10.r),
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
              '${context.read<DetailsCubit>().quantity}',
              style: AppTextStyles.nunito700Size16Black,
            ),
            horizontalSpace(10.w),
            GestureDetector(
              onTap: () {
                context.read<DetailsCubit>().increaseQuantity();
                //context.read<DetailsCubit>().calculateTotalPrice();
              },
              child: Container(
                height: 30.h,
                width: 30.w,
                decoration: BoxDecoration(
                  color: AppColors.greenButt,
                  borderRadius: BorderRadius.circular(10.r),
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
      },
    );
  }
}
