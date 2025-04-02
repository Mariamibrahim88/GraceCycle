import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grace_cycle/core/utils/app_colors.dart';
import 'package:grace_cycle/core/utils/app_spacing.dart';
import 'package:grace_cycle/features/favorites/presentation/views/widgets/asset_fav_card.dart';
import 'package:grace_cycle/features/favorites/presentation/views/widgets/fav_food_card_info.dart';
import 'package:grace_cycle/features/favorites/presentation/views/widgets/fav_vendor_card_info.dart';
import 'package:grace_cycle/features/favorites/presentation/views/widgets/icon_fav_food_card.dart';
import 'package:grace_cycle/features/home/presentation/views/widgets/custom_vendor_logo.dart';
import 'package:grace_cycle/features/home/presentation/views/widgets/favourite_container.dart';
import 'package:grace_cycle/features/home/presentation/views/widgets/rate_container.dart';

class FavoriteVendorCard extends StatelessWidget {
  const FavoriteVendorCard({super.key});

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
              const AssetFavCard(),
              Positioned(
                right: 5.r,
                top: 7.r,
                child: const RateContainer(rate: 4.5),
              ),
              Positioned(
                right: 5.r,
                top: 82.h,
                child: const CustomVendorLogo(
                  logoUrl:
                      'https://res.cloudinary.com/dwlsfsaup/image/upload/v1741929479/13_rl4drc.png',
                ),
              ),
            ],
          ),
          horizontalSpace(6.w),
          const FavVendorCardInfo(),
          // const FavouriteContainer(
          //   color: AppColors.vendorCard,
          // ),
        ],
      ),
    );
  }
}
