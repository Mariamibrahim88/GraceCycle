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
              // إذا كنا في الخطوة الأخيرة (3) لا نظهر أي زر
              if (cubit.currentStep == 3) {
                return const SizedBox();
              }
              // إذا كنا في خطوة التأكيد (2)
              if (cubit.currentStep == 2) {
                return CustomOrderNavBarContainer(
                  text: 'Confirm the Order',
                  onTap: () {
                    cubit.goToNextStep();
                  },
                );
              }
              // باقي الخطوات
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
