import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grace_cycle/core/routes/app_routes.dart';
import 'package:grace_cycle/core/utils/app_assets.dart';
import 'package:grace_cycle/core/utils/app_colors.dart';
import 'package:grace_cycle/core/utils/app_navigate.dart';
import 'package:grace_cycle/core/utils/app_text_styles.dart';
import 'package:grace_cycle/core/widgets/custom_loading.dart';
import 'package:grace_cycle/core/widgets/show_custom_dialog.dart';
import 'package:grace_cycle/features/cart/presentation/manager/cubit/cart_cubit.dart';
import 'package:grace_cycle/features/cart/presentation/manager/cubit/cart_state.dart';
import 'package:grace_cycle/features/details/presentation/manager/cubit/details_cubit.dart';

class CustomBottomCartNavBar extends StatelessWidget {
  const CustomBottomCartNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailsCubit, DetailsState>(
      builder: (context, state) {
        final cubit = context.read<DetailsCubit>();
        final quantity = cubit.quantity;
        final pricePerUnit = cubit.foodItemDetails?.newPrice ?? 0;
        final totalPrice = quantity * pricePerUnit;

        return SizedBox(
          width: double.infinity,
          height: 90.h,
          child: ElevatedButton(
            onPressed: () {
              if (cubit.foodItemDetails!.quantityAvailableDisplay <= 0 ||
                  quantity > cubit.foodItemDetails!.quantityAvailableDisplay) {
                showCustomDialog(
                  context,
                  'You can\'t add this item to the cart because it is out of stock or the quantity you selected exceeds the available stock.',
                  AppAssets.extra,
                  250.h,
                );
              } else {
                BlocProvider.of<CartCubit>(context)
                    .addItemToCart(
                  foodItemDetailsModel: cubit.foodItemDetails!,
                  quantity: quantity,
                )
                    .then((_) {
                  navigate(
                    context: context,
                    route: Routes.cart,
                  );

                  final id = cubit.foodItemDetails?.id;
                  if (id != null) {
                    context.read<DetailsCubit>().getFoodDetails(id: id);
                  }

                  cubit.resetQuantity();
                });
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.basicWhite,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.zero,
              ),
            ),
            child: Container(
              height: 46.h,
              width: 344.w,
              decoration: BoxDecoration(
                color: AppColors.greenButt,
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: BlocBuilder<CartCubit, CartState>(
                    builder: (context, state) {
                  if (state is AddItemToCartFailure) {
                    return Center(
                      child: Text(
                        state.errorMessage,
                        style: AppTextStyles.nunito600Size16White,
                      ),
                    );
                  } else if (state is AddItemToCartLoading) {
                    return const Center(child: CustomLoading());
                  } else {
                    return Row(
                      children: [
                        Text(
                          'Add to cart',
                          style: AppTextStyles.nunito600Size16White,
                        ),
                        const Spacer(),
                        Text(
                          'EGP ${totalPrice.toStringAsFixed(2)}',
                          style: AppTextStyles.nunito600Size16White,
                        ),
                      ],
                    );
                  }
                }),
              ),
            ),
          ),
        );
      },
    );
  }
}
