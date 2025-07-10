import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
