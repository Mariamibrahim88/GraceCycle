import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grace_cycle/core/utils/app_colors.dart';
import 'package:grace_cycle/features/cart/presentation/views/custom_loading_cart.dart';
import 'package:grace_cycle/features/orders/presentation/manager/cubit/checkout_cubit.dart';
import 'package:grace_cycle/features/orders/presentation/views/widgets/item_of_order.dart';

class CustomListOfOrdersItems extends StatelessWidget {
  const CustomListOfOrdersItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckoutCubit, CheckoutState>(
      builder: (context, state) {
        if (state is GetOrderSummaryLoading) {
          return const Center(
            child: CustomLoadingCart(),
          );
        }
        if (state is GetOrderSummarySuccess) {
          if (state.orderSummary.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.receipt_long,
                    size: 60,
                    color: AppColors.greenButt,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'No orders yet',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: AppColors.greenButt,
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Start shopping and Checkout to \nsee your orders here.',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppColors.grayForOrders,
                          fontSize: 18,
                          fontFamily: 'Nunito',
                        ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            );
          }
          return ListView.builder(
            shrinkWrap: true,
            itemCount: state.orderSummary.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 6,
                horizontal: 12,
              ),
              child: ItemOfOrder(orderSummary: state.orderSummary[index]),
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
