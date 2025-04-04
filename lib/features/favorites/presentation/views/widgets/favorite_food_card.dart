import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grace_cycle/core/utils/app_colors.dart';
import 'package:grace_cycle/core/utils/app_spacing.dart';
import 'package:grace_cycle/features/favorites/data/models/fav_food_model.dart';
import 'package:grace_cycle/features/favorites/presentation/views/widgets/asset_fav_card.dart';
import 'package:grace_cycle/features/favorites/presentation/views/widgets/fav_food_card_info.dart';
import 'package:grace_cycle/features/favorites/presentation/views/widgets/icon_fav_food_card.dart';
import 'package:grace_cycle/features/home/presentation/views/widgets/discount_container.dart';
import 'package:grace_cycle/features/home/presentation/views/widgets/rate_container.dart';

class FavoriteFoodCard extends StatelessWidget {
  const FavoriteFoodCard({super.key, required this.favFoodModel});

  final FavFoodModel favFoodModel;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.r),
      ),
      shadowColor: Colors.black38,
      color: AppColors.basicWhite,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              AssetFavCard(
                imageUrl: favFoodModel.picUrl,
              ),
              Positioned(
                right: 5.r,
                top: 7.r,
                child: const RateContainer(rate: 4.5),
              ),
              Positioned(
                right: 5.r,
                top: 60.h,
                child: SizedBox(
                  width: 33.w,
                  height: 33.h,
                  child: DiscountContainer(fontSize: 13.sp, discount: 30),
                ),
              ),
            ],
          ),
          horizontalSpace(6.w),
          FavFoodCardInfo(
            favFoodModel: favFoodModel,
          ),
          horizontalSpace(8.w),
          const IconsFavFoodCard()
        ],
      ),
    );
  }
}
