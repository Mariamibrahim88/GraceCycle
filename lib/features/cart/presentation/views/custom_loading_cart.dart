import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grace_cycle/core/widgets/custom_app_bar.dart';
import 'package:grace_cycle/features/cart/presentation/views/widgets/custom_cart_item_shimmer.dart';

class CustomLoadingCart extends StatelessWidget {
  const CustomLoadingCart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 22,
        ),
        CustomAppBar(
          title: 'Your Cart',
          fontStyle: 22.sp,
          color: Colors.black,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        const SizedBox(
          height: 120,
        ),
        const CustomCartItemShimmer(),
        const CustomCartItemShimmer(),
        const CustomCartItemShimmer(),
        const CustomCartItemShimmer(),
        const CustomCartItemShimmer(),
      ],
    );
  }
}
