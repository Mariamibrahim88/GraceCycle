import 'package:flutter/material.dart';
import 'package:grace_cycle/core/utils/app_colors.dart';
import 'package:grace_cycle/features/cart/presentation/views/widgets/checkout_view_body.dart';
import 'package:grace_cycle/features/cart/presentation/views/widgets/custom_order_nav_bar_container.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
          backgroundColor: AppColors.basicWhite,
          body: CheckoutViewBody(),
          bottomNavigationBar: CustomOrderNavBarContainer()),
    );
  }
}
