import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grace_cycle/core/utils/app_assets.dart';
import 'package:grace_cycle/core/utils/app_colors.dart';
import 'package:grace_cycle/core/utils/app_spacing.dart';
import 'package:grace_cycle/core/utils/app_text_styles.dart';
import 'package:grace_cycle/features/orders/presentation/views/widgets/custom_info_of_payment.dart';
import 'package:grace_cycle/features/orders/presentation/views/widgets/custom_row_of_payment_method.dart';

class PaymentSection extends StatelessWidget {
  const PaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Payment Method',
            style: AppTextStyles.nunito700Size18Black,
          ),
          verticalSpace(10),
          Container(
            height: 46.h,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.r),
                border: Border.all(
                  color: AppColors.grayForCheckout,
                  width: 1,
                )),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: Row(
                children: [
                  SvgPicture.asset(AppAssets.cash),
                  horizontalSpace(5),
                  Text('Cash on Delivery',
                      style: AppTextStyles.nunito400Size16GrayForCheckout),
                ],
              ),
            ),
          ),
          verticalSpace(20),
          Container(
            height: 344.h,
            width: 342.w,
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColors.grayForCheckout,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpace(10),
                const CustomRowOfPaymentMethods(),
                verticalSpace(10),
                const CustomInfoOfPayment(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
