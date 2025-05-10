import 'package:flutter/material.dart';
import 'package:grace_cycle/core/widgets/custom_safe_area.dart';
import 'package:grace_cycle/features/order/presentation/views/widgets/confirm_reciving_view_body.dart';

class ConfirmRecivingView extends StatelessWidget {
  const ConfirmRecivingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomSafeArea(
      body: ConfirmRecivingViewBody(),
    );
  }
}
