import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grace_cycle/core/utils/app_spacing.dart';
import 'package:grace_cycle/core/widgets/custom_app_bar.dart';
import 'package:grace_cycle/features/cart/presentation/views/widgets/custom_list_of_cart_items.dart';
import 'package:grace_cycle/features/cart/presentation/views/widgets/empty_cart.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 12.w,
        right: 12.w,
        top: 32.h,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            verticalSpace(30.h),
            CustomAppBar(
              title: 'Your Cart',
              color: Colors.black,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            verticalSpace(20.h),
            const EmptyCart(),
            //const CustomListOfCartItems(),
          ],
        ),
      ),
    );
  }
}
