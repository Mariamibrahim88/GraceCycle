import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grace_cycle/core/utils/app_colors.dart';
import 'package:grace_cycle/features/orders/presentation/manager/cubit/checkout_cubit.dart';
import 'package:grace_cycle/features/orders/presentation/views/widgets/checkout_view_body.dart';
import 'package:grace_cycle/features/cart/presentation/views/widgets/custom_order_nav_bar_container.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: AppColors.basicWhite,
          body: const CheckoutViewBody(),
          bottomNavigationBar: BlocBuilder<CheckoutCubit, CheckoutState>(
            builder: (context, state) {
              final cubit = context.read<CheckoutCubit>();

              // If we're in the last step (3), don't show any button
              if (cubit.currentStep == 4) {
                return const SizedBox();
              }

              // If we're in the confirmation step (2)
              if (cubit.currentStep == 3) {
                return CustomOrderNavBarContainer(
                  text: 'Confirm the Order',
                  onTap: () {
                    cubit.goToNextStep();
                  },
                );
              }

              // If we're in the receiving address step (1), update delivery first
              if (cubit.currentStep == 2) {
                return CustomOrderNavBarContainer(
                  text: 'Continue',
                  onTap: () async {
                    // Validate delivery method and address first
                    if (!cubit.isDeliveryValid()) {
                      // Show error message
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(cubit.getValidationError() ??
                              'Please check your delivery information'),
                          backgroundColor: Colors.red,
                        ),
                      );
                      return;
                    }

                    // The delivery method and address are already saved when user changes them
                    // Just proceed to next step
                    cubit.goToNextStep();
                  },
                );
              }
              if (cubit.currentStep == 1) {
                return CustomOrderNavBarContainer(
                  text: 'Continue',
                  onTap: () async {
                    cubit.goToNextStep();
                    cubit.paymentIntent(orderId: cubit.orderId!);
                  },
                );
              }

              // Other steps
              return CustomOrderNavBarContainer(
                text: 'Continue',
                onTap: () {
                  cubit.goToNextStep();
                },
              );
            },
          )),
    );
  }
}
