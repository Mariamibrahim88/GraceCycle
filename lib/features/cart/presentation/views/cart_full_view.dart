import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grace_cycle/core/utils/app_colors.dart';
import 'package:grace_cycle/features/cart/presentation/manager/cubit/cart_cubit.dart';
import 'package:grace_cycle/features/cart/presentation/manager/cubit/cart_state.dart';
import 'package:grace_cycle/features/cart/presentation/views/widgets/cart_full_view_body.dart';
import 'package:grace_cycle/features/cart/presentation/views/widgets/custom_buttom_nav_bar_full_cart.dart';

class CartFullView extends StatelessWidget {
  const CartFullView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.basicWhite,
        body: const CartFullViewBody(),
        bottomNavigationBar: BlocBuilder<CartCubit, CartState>(
          builder: (context, state) {
            if (state is GetCartItemsForSpecificVendorSuccess &&
                state.cartItemsForSpecificVendorList.isNotEmpty) {
              final vendor = state.cartItemsForSpecificVendorList.first;

              return CustomButtomNavBarFullCart(
                  total: vendor.total, count: vendor.count);
            }

            return const SizedBox();
          },
        ),
      ),
    );
  }
}
