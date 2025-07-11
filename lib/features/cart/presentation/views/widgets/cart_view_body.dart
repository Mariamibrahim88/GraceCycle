import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grace_cycle/core/utils/app_spacing.dart';
import 'package:grace_cycle/core/widgets/custom_app_bar.dart';
import 'package:grace_cycle/features/cart/presentation/manager/cubit/cart_cubit.dart';
import 'package:grace_cycle/features/cart/presentation/manager/cubit/cart_state.dart';
import 'package:grace_cycle/features/cart/presentation/views/custom_loading_cart.dart';
import 'package:grace_cycle/features/cart/presentation/views/widgets/custom_list_of_cart_items_for_any_vendor.dart';
import 'package:grace_cycle/features/cart/presentation/views/widgets/empty_cart.dart';

class CartViewBody extends StatefulWidget {
  const CartViewBody({super.key});

  @override
  State<CartViewBody> createState() => _CartViewBodyState();
}

class _CartViewBodyState extends State<CartViewBody> {
  bool _cartModified = false;

  @override
  void initState() {
    super.initState();
    // جلب بيانات الكارت عند فتح الصفحة
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<CartCubit>().getCartItemsForAnyVendor();
    });
  }

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
              title: 'Your Cart',
              fontStyle: 22.sp,
              color: Colors.black,
              onPressed: () {
                Navigator.pop(context, _cartModified);
              },
            ),
            verticalSpace(20.h),
            BlocListener<CartCubit, CartState>(
              listener: (context, state) {
                // تتبع التغييرات في الكارت
                if (state is UpdateItemInCartSuccess ||
                    state is AddItemToCartSuccess) {
                  setState(() {
                    _cartModified = true;
                  });
                }
              },
              child: BlocBuilder<CartCubit, CartState>(
                builder: (context, state) {
                  if (state is GetCartItemsForAnyVendorFailure) {
                    return Center(child: Text(state.errorMessage));
                  } else if (state is GetCartItemsForAnyVendorSuccess) {
                    return state.cartItemsForAnyVendorList.isEmpty
                        ? const Padding(
                            padding: EdgeInsets.only(top: 90.0),
                            child: EmptyCart(),
                          )
                        : CustomListOfCartItemsForAnyVendor(
                            cartItemsForAnyVendorModel:
                                state.cartItemsForAnyVendorList);
                  } else {
                    return const CustomLoadingCart();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
