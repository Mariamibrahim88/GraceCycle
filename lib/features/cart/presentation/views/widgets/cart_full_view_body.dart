import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grace_cycle/core/utils/app_spacing.dart';
import 'package:grace_cycle/core/widgets/custom_app_bar.dart';
import 'package:grace_cycle/features/cart/presentation/manager/cubit/cart_cubit.dart';
import 'package:grace_cycle/features/cart/presentation/manager/cubit/cart_state.dart';
import 'package:grace_cycle/features/cart/presentation/views/widgets/custom_list_of_cart_items_for_specefic_vendor.dart';
import 'package:grace_cycle/features/cart/presentation/views/widgets/head_of_vendor_in_full_cart.dart';

class CartFullViewBody extends StatelessWidget {
  const CartFullViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.only(
          left: 12.w,
          right: 12.w,
          top: 22.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppBar(
              onPressed: () {
                Navigator.pop(context, true);
              },
            ),
            verticalSpace(5),
            BlocBuilder<CartCubit, CartState>(
              builder: (context, state) {
                if (state is GetCartItemsForSpecificVendorSuccess &&
                    state.cartItemsForSpecificVendorList.isNotEmpty) {
                  final vendor = state.cartItemsForSpecificVendorList.first;
                  return HeadOfVendorInFullCart(vendorName: vendor.vendorName);
                }
                return const SizedBox();
              },
            ),
            verticalSpace(20),
            const CustomListOfCartItemsForSpeceficVendor(),
          ],
        ),
      ),
    );
  }
}
