import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grace_cycle/core/utils/app_colors.dart';
import 'package:grace_cycle/core/utils/app_spacing.dart';
import 'package:grace_cycle/features/favorites/data/models/fav_vendor_model.dart';
import 'package:grace_cycle/features/favorites/presentation/views/widgets/asset_fav_card.dart';
import 'package:grace_cycle/features/favorites/presentation/views/widgets/fav_vendor_card_info.dart';
import 'package:grace_cycle/features/home/presentation/views/widgets/custom_vendor_logo.dart';
import 'package:grace_cycle/features/home/presentation/views/widgets/rate_container.dart';

class FavoriteVendorCard extends StatelessWidget {
  const FavoriteVendorCard({super.key, required this.favVendorModel});

  final FavVendorModel favVendorModel;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.r),
      ),
      shadowColor: Colors.black38,
      color: AppColors.vendorCard,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              AssetFavCard(
                imageUrl: favVendorModel.picUrl,
              ),
              Positioned(
                right: 5.r,
                top: 7.r,
                child: const RateContainer(rate: 4.5),
              ),
              Positioned(
                right: 5.r,
                top: 55.h,
                child: CustomVendorLogo(
                  logoUrl: favVendorModel.logoUrl,
                ),
              ),
            ],
          ),
          horizontalSpace(10.w),
          FavVendorCardInfo(
            favVendorModel: favVendorModel,
          ),
          horizontalSpace(20.w),
          // const Center(
          //   child: FavouriteContainer(
          //     color: AppColors.vendorCard,
          //   ),
          // ),
        ],
      ),
    );
  }
}
