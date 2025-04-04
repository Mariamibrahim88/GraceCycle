import 'package:flutter/material.dart';
import 'package:grace_cycle/core/widgets/custom_safe_area.dart';
import 'package:grace_cycle/features/cart/presentation/views/widgets/cart_view_body.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomSafeArea(body: CartViewBody());
  }
}
