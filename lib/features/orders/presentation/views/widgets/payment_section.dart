import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grace_cycle/core/utils/app_assets.dart';
import 'package:grace_cycle/core/utils/app_colors.dart';
import 'package:grace_cycle/core/utils/app_spacing.dart';
import 'package:grace_cycle/core/utils/app_text_styles.dart';
import 'package:grace_cycle/features/orders/presentation/manager/cubit/checkout_cubit.dart';
import 'package:grace_cycle/features/orders/presentation/views/widgets/custom_info_of_payment.dart';
import 'package:grace_cycle/features/orders/presentation/views/widgets/custom_row_of_payment_method.dart';

class PaymentSection extends StatefulWidget {
  const PaymentSection({super.key});

  @override
  State<PaymentSection> createState() => _PaymentSectionState();
}

class _PaymentSectionState extends State<PaymentSection> {
  // 0: Cash on Delivery, 1: Other (placeholder for more methods)
  int _selectedPaymentMethod = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckoutCubit, CheckoutState>(
      builder: (context, state) {
        double? amount;
        String? clientSecret;
        bool isLoading = false;
        String? error;

        if (state is PaymentIntentSuccess) {
          amount = state.paymentIntent.total;
          clientSecret = state.paymentIntent.clientSecret;
        } else if (state is PaymentIntentLoading) {
          isLoading = true;
        } else if (state is PaymentIntentFailure) {
          error = state.error;
        }

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
              GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedPaymentMethod = 0;
                  });
                },
                child: Container(
                  height: 46.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r),
                    border: Border.all(
                      color: _selectedPaymentMethod == 0
                          ? AppColors.basicGreen
                          : AppColors.grayForCheckout,
                      width: 2,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    child: Row(
                      children: [
                        SvgPicture.asset(AppAssets.cash),
                        horizontalSpace(5),
                        Text('Cash on Delivery',
                            style:
                                AppTextStyles.nunito400Size16GrayForCheckout),
                      ],
                    ),
                  ),
                ),
              ),
              verticalSpace(20),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedPaymentMethod = 1;
                  });
                  if (amount != null && clientSecret != null) {
                    final cubit = context.read<CheckoutCubit>();
                    cubit.makePayment(amount.toInt(), clientSecret);
                    print('$amount................................');
                    print('$clientSecret................................');
                  }
                },
                child: Container(
                  height: 344.h,
                  width: 342.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r),
                    border: Border.all(
                      color: _selectedPaymentMethod == 1
                          ? AppColors.basicGreen
                          : AppColors.grayForCheckout,
                      width: 2,
                    ),
                  ),
                  child: isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : error != null
                          ? Center(child: Text('Error: $error'))
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                verticalSpace(10),
                                const CustomRowOfPaymentMethods(),
                                verticalSpace(10),
                                const CustomInfoOfPayment(),
                              ],
                            ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
