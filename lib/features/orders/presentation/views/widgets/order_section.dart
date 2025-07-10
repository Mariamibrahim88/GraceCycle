import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grace_cycle/core/service/service_locator.dart';
import 'package:grace_cycle/core/utils/app_colors.dart';
import 'package:grace_cycle/core/utils/app_spacing.dart';
import 'package:grace_cycle/core/utils/app_text_styles.dart';
import 'package:grace_cycle/features/cart/presentation/views/custom_loading_cart.dart';
import 'package:grace_cycle/features/orders/presentation/manager/cubit/checkout_cubit.dart';
import 'package:grace_cycle/features/orders/presentation/views/widgets/list_of_name_of_food_checkout.dart';

class OrderSection extends StatelessWidget {
  const OrderSection({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckoutCubit, CheckoutState>(
      builder: (context, state) {
        if (state is GetOrderDetailsError) {
          return Text(state.error);
        } else if (state is GetOrderDetailsSuccess) {
          print(
              'Order details loaded successfully for orderId: ${state.orderDetails.id}');
          return Column(
            children: [
              //  FoodCardInfullCart(
              //   cartItem: CartItem.fromOrderItem(state.orderDetails.items.first),
              //   vendorId: state.orderDetails.vendorName,
              //  ),
              verticalSpace(20.h),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Order summary',
                      style: AppTextStyles.nunito700Size22GreenButt),
                  verticalSpace(15.h),
                  ListOfNameOfFoodCheckout(
                    paymentSummary: state.orderDetails.paymentSummary,
                  ),
                  verticalSpace(5.h),
                  Container(
                    height: 41.h,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: AppColors.cardofCart,
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.w),
                      child: Row(
                        children: [
                          Text('Total savings',
                              style: AppTextStyles.nunito600Size18Black),
                          const Spacer(),
                          Text(state.orderDetails.totalSavings.toString(),
                              style: AppTextStyles.nunito600Size18Black),
                        ],
                      ),
                    ),
                  )
                ],
              )
            ],
          );
        } else if (state is GetOrderDetailsLoading) {
          return const CustomLoadingCart();
        }
        return const SizedBox.shrink(
          child: Text('No order details available'),
        );
      },
    );
  }
}
