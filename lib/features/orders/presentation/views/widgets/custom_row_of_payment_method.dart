import 'package:flutter/material.dart';
import 'package:grace_cycle/core/utils/app_assets.dart';
import 'package:grace_cycle/core/utils/app_spacing.dart';
import 'package:grace_cycle/features/orders/presentation/views/widgets/custom_container_of_payment_image.dart';

class CustomRowOfPaymentMethods extends StatelessWidget {
  const CustomRowOfPaymentMethods({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomContainerOfPaymentImage(
          image: AppAssets.instaPay,
        ),
        horizontalSpace(5),
        CustomContainerOfPaymentImage(
          image: AppAssets.payPal,
        ),
        horizontalSpace(5),
        CustomContainerOfPaymentImage(
          image: AppAssets.visa,
        ),
        horizontalSpace(5),
        CustomContainerOfPaymentImage(
          image: AppAssets.master,
        ),
      ],
    );
  }
}
