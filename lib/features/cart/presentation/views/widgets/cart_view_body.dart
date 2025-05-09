import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grace_cycle/core/utils/app_spacing.dart';
import 'package:grace_cycle/core/widgets/custom_app_bar.dart';
import 'package:grace_cycle/features/cart/presentation/views/widgets/custom_list_of_cart_items.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

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
          children: [
            // verticalSpace(30.h),
            CustomAppBar(
              title: 'Your Cart',
              fontStyle: 22.sp,
              color: Colors.black,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            verticalSpace(20.h),
            //const EmptyCart(),
            const CustomListOfCartItems(),
          ],
        ),
      ),
    );
  }
}
