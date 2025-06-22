import 'package:flutter/material.dart';
import 'package:grace_cycle/features/cart/presentation/views/widgets/custom_cart_item_shimmer.dart';

class CustomLoadingCart extends StatelessWidget {
  const CustomLoadingCart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CustomCartItemShimmer(),
        CustomCartItemShimmer(),
        CustomCartItemShimmer(),
        CustomCartItemShimmer(),
        CustomCartItemShimmer(),
      ],
    );
  }
}
