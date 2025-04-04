import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grace_cycle/core/utils/app_colors.dart';
import 'package:grace_cycle/core/utils/app_spacing.dart';
import 'package:grace_cycle/features/favorites/data/models/fav_vendor_model.dart';
import 'package:grace_cycle/features/favorites/presentation/views/widgets/available_vendor_container.dart';

class FavVendorCardInfo extends StatelessWidget {
  const FavVendorCardInfo({
    super.key,
    required this.favVendorModel,
  });

  final FavVendorModel favVendorModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      mainAxisSize: MainAxisSize.min,
      children: [
        verticalSpace(4.h),
        Text(
          favVendorModel.displayName,
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
        verticalSpace(6.h),
        SizedBox(
          child: Text(
            favVendorModel.address,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
          ),
        ),
        verticalSpace(4.h),
        AvailableVendorContainer(
            color: AppColors.basicWhite,
            available: '${favVendorModel.items}+ items available'),
      ],
    );
  }
}
