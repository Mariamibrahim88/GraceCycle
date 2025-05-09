import 'package:flutter/material.dart';
import 'package:grace_cycle/core/utils/app_colors.dart';
import 'package:grace_cycle/features/cart/presentation/views/widgets/cart_full_view_body.dart';
import 'package:grace_cycle/features/cart/presentation/views/widgets/custom_buttom_nav_bar_full_cart.dart';

class CartFullView extends StatelessWidget {
  const CartFullView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.basicWhite,
        body: CartFullViewBody(),
        bottomNavigationBar: CustomButtomNavBarFullCart(),
      ),
    );
  }
}
