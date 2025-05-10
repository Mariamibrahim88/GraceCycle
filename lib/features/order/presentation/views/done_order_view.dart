import 'package:flutter/material.dart';
import 'package:grace_cycle/core/widgets/custom_safe_area.dart';
import 'package:grace_cycle/features/order/presentation/views/widgets/done_order_view_body.dart';

class DoneOrderView extends StatelessWidget {
  const DoneOrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomSafeArea(
      body: DoneOrderViewBody(),
    );
  }
}