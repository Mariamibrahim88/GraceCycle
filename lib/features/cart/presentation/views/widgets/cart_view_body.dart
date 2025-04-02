import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grace_cycle/core/utils/app_assets.dart';
import 'package:grace_cycle/core/utils/app_colors.dart';
import 'package:grace_cycle/core/utils/app_spacing.dart';
import 'package:grace_cycle/core/widgets/custom_app_bar.dart';
import 'package:grace_cycle/core/widgets/custom_buttom_nav_bar.dart';

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
            verticalSpace(20.h),
            CustomAppBar(
              title: 'Your Cart',
              color: Colors.black,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            verticalSpace(32.h),
            SvgPicture.asset(
              AppAssets.cart,
              height: 250.h,
            ),
            verticalSpace(16.h),
            Text('Your Cart is Empty',
                style: GoogleFonts.nunito(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w800,
                    color: Colors.black)),
            verticalSpace(15),
            Text(
                'When you add products, they will \n appear in your shopping cart',
                textAlign: TextAlign.center,
                style: GoogleFonts.nunito(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                )),
          ],
        ),
      ),
    );
  }
}
