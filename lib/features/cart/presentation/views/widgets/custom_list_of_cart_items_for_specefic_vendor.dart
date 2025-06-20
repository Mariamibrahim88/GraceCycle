import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grace_cycle/features/cart/presentation/manager/cubit/cart_cubit.dart';
import 'package:grace_cycle/features/cart/presentation/manager/cubit/cart_state.dart';
import 'package:grace_cycle/features/cart/presentation/views/custom_loading_cart.dart';
import 'package:grace_cycle/features/cart/presentation/views/widgets/food_card_in_full_cart.dart';

class CustomListOfCartItemsForSpeceficVendor extends StatelessWidget {
  const CustomListOfCartItemsForSpeceficVendor({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        if (state is GetCartItemsForSpecificVendorFailure) {
          return Center(child: Text(state.errorMessage));
        } else if (state is GetCartItemsForSpecificVendorLoading) {
          return const CustomLoadingCart();
        } else if (state is GetCartItemsForSpecificVendorSuccess) {
          return ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: state.cartItemsForSpecificVendorList.length,
            itemBuilder: (context, vendorIndex) {
              final vendor = state.cartItemsForSpecificVendorList[vendorIndex];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: vendor.items.map((cartItem) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: FoodCardInfullCart(cartItem: cartItem),
                  );
                }).toList(),
              );
            },
          );
        }
        return const CustomLoadingCart();
      },
    );
  }
}
