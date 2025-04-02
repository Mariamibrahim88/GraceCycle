import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grace_cycle/core/utils/app_colors.dart';
import 'package:grace_cycle/core/utils/app_spacing.dart';
import 'package:grace_cycle/features/favorites/presentation/views/widgets/available_vendor_container.dart';
import 'package:grace_cycle/features/home/presentation/views/widgets/left_pieces_container.dart';

class FavVendorCardInfo extends StatelessWidget {
  const FavVendorCardInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        verticalSpace(4.h),
        Text(
          'Hypermarket',
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        verticalSpace(8),
        SizedBox(
          child: Text(
            'Misr Ismailia  ',
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
          ),
        ),
        verticalSpace(27.h),
        const AvailableVendorContainer(
            color: AppColors.basicWhite, available: '7+ items available'),
      ],
    );
  }
}
