import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grace_cycle/core/utils/app_colors.dart';
import 'package:grace_cycle/core/utils/app_spacing.dart';
import 'package:grace_cycle/features/home/data/models/vendors_model.dart';
import 'package:grace_cycle/features/home/presentation/views/widgets/asset_of_vendor.dart';
import 'package:grace_cycle/features/home/presentation/views/widgets/favourite_restaurant_container.dart';
import 'package:grace_cycle/features/home/presentation/views/widgets/rate_container.dart';
import 'package:grace_cycle/features/home/presentation/views/widgets/vendor_info.dart';

class VendorCard extends StatelessWidget {
  const VendorCard({
    super.key,
    required this.vendorItemModel,
  });
  final VendorItemModel vendorItemModel;
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AssetOfVendor(
                      vendorItemModel: vendorItemModel,
                    ),
                    verticalSpace(5),
                    VendorInfo(
                      vendorItemModel: vendorItemModel,
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
