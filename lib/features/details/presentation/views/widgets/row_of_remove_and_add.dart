import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grace_cycle/core/utils/app_assets.dart';
import 'package:grace_cycle/core/utils/app_colors.dart';
import 'package:grace_cycle/core/utils/app_spacing.dart';
import 'package:grace_cycle/core/utils/app_text_styles.dart';
import 'package:grace_cycle/core/widgets/show_custom_dialog.dart';
import 'package:grace_cycle/features/details/data/models/food_item_details_model.dart';
import 'package:grace_cycle/features/details/presentation/manager/cubit/details_cubit.dart';

class RowOfRemoveAndAdd extends StatelessWidget {
  const RowOfRemoveAndAdd({super.key, required this.foodItemDetailsModel});
  final FoodItemDetailsModel foodItemDetailsModel;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailsCubit, DetailsState>(
      builder: (context, state) {
        final cubit = context.read<DetailsCubit>();
        int quantity = 1;
        if (state is IncreaseQuantityState) {
          quantity = state.quantity;
        } else if (state is DecreaseQuantityState) {
          quantity = state.quantity;
        }
        return Row(
          children: [
            // زرار النقصان
            GestureDetector(
              onTap: cubit.decreaseQuantity,
              child: Container(
                height: 30.h,
                width: 30.w,
                decoration: BoxDecoration(
                  border: quantity == 1
                      ? Border.all(color: Colors.grey[600] ?? Colors.grey)
                      : Border.all(color: AppColors.greenButt),
                  borderRadius: BorderRadius.circular(10.r),
                  boxShadow: quantity == 1
                      ? [
                          BoxShadow(
                            color: Colors.grey[400] ?? Colors.grey,
                            offset: const Offset(
                                0, 1), // changes position of shadow
                            blurStyle: BlurStyle.solid,
                          ),
                        ]
                      : [],
                ),
                child: quantity == 1
                    ? Icon(
                        Icons.remove,
                        color: Colors.grey[400] ?? Colors.grey,
                      )
                    : const Icon(Icons.remove, color: AppColors.greenButt),
              ),
            ),

            horizontalSpace(10.w),

            // BlocBuilder لعرض العدد
            BlocBuilder<DetailsCubit, DetailsState>(
              builder: (context, state) {
                int quantity = cubit.quantity;
                return Text(
                  '$quantity',
                  style: AppTextStyles.nunito700Size16Black,
                );
              },
            ),

            horizontalSpace(10.w),

            // زرار الزيادة
            GestureDetector(
              onTap: () {
                if (cubit.quantity >= foodItemDetailsModel.quantity) {
                  showCustomDialog(
                    context,
                    'You have exceeded the \nnumber of available pieces!',
                    AppAssets.extra,
                    250.h,
                  );
                } else {
                  cubit.increaseQuantity();
                }
              },
              child: Container(
                height: 30.h,
                width: 30.w,
                decoration: BoxDecoration(
                  color: AppColors.greenButt,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: const Icon(Icons.add, color: Colors.white),
              ),
            ),
          ],
        );
      },
    );
  }
}
