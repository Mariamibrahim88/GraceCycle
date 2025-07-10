import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grace_cycle/core/widgets/custom_safe_area.dart';
import 'package:grace_cycle/features/orders/presentation/manager/cubit/checkout_cubit.dart';
import 'package:grace_cycle/features/orders/presentation/views/widgets/orders_view_body.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomSafeArea(
      body: BlocProvider(
        create: (context) => CheckoutCubit(context)..getOrderSummary(),
        child: const OrdersViewBody(),
      ),
    );
  }
}
