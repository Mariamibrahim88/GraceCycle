import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grace_cycle/core/utils/app_assets.dart';
import 'package:grace_cycle/core/widgets/custom_app_bar.dart';
import 'package:grace_cycle/features/orders/data/cubit/checkout_cubit.dart';
import 'package:grace_cycle/features/orders/presentation/views/widgets/container_of_icon.dart';
import 'package:grace_cycle/features/cart/presentation/views/widgets/head_of_vendor_in_full_cart.dart';
import 'package:grace_cycle/features/orders/presentation/views/widgets/order_section.dart';
import 'package:grace_cycle/features/orders/presentation/views/widgets/payment_section.dart';
import 'package:grace_cycle/features/orders/presentation/views/widgets/receive_section.dart';
import '../../../../../core/utils/app_spacing.dart';

class CheckoutViewBody extends StatelessWidget {
  const CheckoutViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckoutCubit, CheckoutState>(
      builder: (context, state) {
        final currentStep = context.read<CheckoutCubit>().currentStep;
        Widget sectionOfStepper;
        switch (currentStep) {
          case 0:
            sectionOfStepper = const OrderSection();
            break;
          case 1:
            sectionOfStepper = const ReceiveSection();
            break;
          case 2:
            sectionOfStepper = const PaymentSection();
            break;
          default:
            sectionOfStepper = const Center(child: Text("Confirmation Step"));
        }
        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomAppBar(onPressed: () {
                  Navigator.pop(context);
                }),
                verticalSpace(5.h),
                const HeadOfVendorInFullCart(),
                verticalSpace(20.h),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: ContainerOfIcon(
                          text: 'Order',
                          icon: AppAssets.order,
                          isActive: currentStep >= 0,
                        ),
                      ),
                      buildStepLine(currentStep >= 1),
                      Expanded(
                        child: ContainerOfIcon(
                          text: 'Receiving address',
                          icon: AppAssets.location,
                          isActive: currentStep >= 1,
                        ),
                      ),
                      buildStepLine(currentStep >= 2),
                      Expanded(
                        child: ContainerOfIcon(
                          text: 'Payment Method',
                          icon: AppAssets.payment,
                          isActive: currentStep >= 2,
                        ),
                      ),
                      buildStepLine(currentStep >= 3),
                      Expanded(
                        child: ContainerOfIcon(
                          text: 'Confirm receiving',
                          icon: AppAssets.confirm,
                          isActive: currentStep >= 3,
                        ),
                      ),
                    ],
                  ),
                ),
                verticalSpace(20.h),
                sectionOfStepper,
              ],
            ),
          ),
        );
      },
    );
  }
}
