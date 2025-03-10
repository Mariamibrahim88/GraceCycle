import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grace_cycle/core/utils/app_colors.dart';
import 'package:grace_cycle/core/utils/app_spacing.dart';
import 'package:grace_cycle/features/home/presentation/views/widgets/asset_of_vendor.dart';
import 'package:grace_cycle/features/home/presentation/views/widgets/favourite_restaurant_container.dart';
import 'package:grace_cycle/features/home/presentation/views/widgets/rate_container.dart';
import 'package:grace_cycle/features/home/presentation/views/widgets/vendor_info.dart';

class VendorCard extends StatelessWidget {
  const VendorCard({
    super.key,
    required this.vendorAddress,
    required this.vendorTime,
    required this.vendorDistance,
    required this.vendorLogo,
    required this.vendorImage,
    required this.vendorName,
  });
  final String vendorName;
  final String vendorAddress;
  final String vendorTime;
  final String vendorDistance;
  final String vendorLogo;
  final String vendorImage;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
            elevation: 2,
            color: AppColors.vendorCard,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AssetOfVendor(vendorImage: vendorImage),
                    verticalSpace(5),
                    VendorInfo(
                      vendorName: vendorName,
                      vendorAddress: vendorAddress,
                      vendorTime: vendorTime,
                      vendorDistance: vendorDistance,
                      vendorLogo: vendorLogo,
                    ),
                  ]),
            )),
        Positioned(
          top: 30.h,
          left: 1.w,
          right: 35.w,
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              RateContainer(
                rate: 4.5,
              ),
            ],
          ),
        ),
        const FavouriteRestaurantContainer()
      ],
    );
  }
}
