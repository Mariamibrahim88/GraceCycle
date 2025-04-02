import 'package:flutter/material.dart';
import 'package:grace_cycle/core/utils/app_colors.dart';
import 'package:grace_cycle/core/widgets/custom_cancel_icon.dart';

class IconsFavFoodCard extends StatelessWidget {
  const IconsFavFoodCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomCancelIcon(),
        SizedBox(
          height: 80,
        ),
        Icon(
          Icons.shopping_cart_outlined,
          color: AppColors.shoppingCart,
          size: 28,
        ),
      ],
    );
  }
}



