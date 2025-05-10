import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grace_cycle/core/utils/app_spacing.dart';
import 'package:grace_cycle/core/utils/app_text_styles.dart';
import 'package:grace_cycle/features/orders/presentation/views/widgets/custom_text_field_of_payment_methods.dart';

class CustomInfoOfPayment extends StatelessWidget {
  const CustomInfoOfPayment({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Card Number',
            style: AppTextStyles.nunito600Size16Black,
          ),
          verticalSpace(8),
          const CustomTextFieldOfPaymentMethods(
            height: 46,
            width: 311,
          ),
          verticalSpace(5),
          Text(
            'Holder Name',
            style: AppTextStyles.nunito600Size16Black,
          ),
          verticalSpace(8),
          const CustomTextFieldOfPaymentMethods(
            height: 46,
            width: 311,
          ),
          verticalSpace(5),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Expiry Date',
                    style: AppTextStyles.nunito600Size16Black,
                  ),
                  verticalSpace(5),
                  const CustomTextFieldOfPaymentMethods(
                    height: 46,
                    width: 140,
                  ),
                ],
              ),
              horizontalSpace(10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'CVV',
                    style: AppTextStyles.nunito600Size16Black,
                  ),
                  verticalSpace(5),
                  const CustomTextFieldOfPaymentMethods(
                    height: 46,
                    width: 140,
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
