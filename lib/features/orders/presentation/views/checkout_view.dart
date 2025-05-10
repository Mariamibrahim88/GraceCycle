import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grace_cycle/core/utils/app_colors.dart';
import 'package:grace_cycle/features/orders/data/cubit/checkout_cubit.dart';
import 'package:grace_cycle/features/orders/presentation/views/widgets/checkout_view_body.dart';
import 'package:grace_cycle/features/cart/presentation/views/widgets/custom_order_nav_bar_container.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CheckoutCubit(),
      child: SafeArea(
        child: Scaffold(
            backgroundColor: AppColors.basicWhite,
            body: const CheckoutViewBody(),
            bottomNavigationBar: BlocBuilder<CheckoutCubit, CheckoutState>(
              builder: (context, state) {
                final cubit = context.read<CheckoutCubit>();
                return cubit.currentStep == 2
                    ? CustomOrderNavBarContainer(
                        text: 'Confirm the Order',
                        onTap: () {},
                      )
                    : CustomOrderNavBarContainer(
                        text: 'Continue',
                        onTap: () {
                          cubit.goToNextStep();
                        },
                      );
              },
            )),
      ),
    );
  }
}
