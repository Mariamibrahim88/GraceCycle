import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grace_cycle/core/utils/app_assets.dart';
import 'package:grace_cycle/core/utils/app_spacing.dart';
import 'package:grace_cycle/core/utils/app_text_styles.dart';

class EmptyCart extends StatelessWidget {
  const EmptyCart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SvgPicture.asset(
            AppAssets.cart,
            height: 250.h,
          ),
          verticalSpace(16.h),
          Text('Your Cart is Empty', style: AppTextStyles.nunito800Size18Black),
          verticalSpace(15),
          Text(
              'When you add products, they will \n appear in your shopping cart',
              textAlign: TextAlign.center,
              style: AppTextStyles.nunito500Size14Black),
        ],
      ),
    );
  }
}
