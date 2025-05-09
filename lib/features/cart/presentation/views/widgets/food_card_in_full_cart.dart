import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grace_cycle/core/utils/app_colors.dart';
import 'package:grace_cycle/core/utils/app_spacing.dart';
import 'package:grace_cycle/features/details/presentation/views/widgets/item_offered_info.dart';
import 'package:grace_cycle/features/details/presentation/views/widgets/remove_and_add_cart_item.dart';
import 'package:grace_cycle/features/favorites/presentation/views/widgets/asset_fav_card.dart';

class FoodCardInfullCart extends StatelessWidget {
  const FoodCardInfullCart({
    super.key,
  });

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
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const AssetFavCard(
            imageUrl:
                'https://images.immediate.co.uk/production/volatile/sites/30/2024/06/Gluten-free-chocolate-pear-pudding-cake-2-9550ff2.jpg',
          ),
          horizontalSpace(15.w),
          const ItemOfferedInfo(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Icon(
                Icons.close_sharp,
                size: 22,
                color: AppColors.redForPrice,
              ),
              verticalSpace(30.h),
              const RemoveAndAddCartItem()
            ],
          ),
        ],
      ),
    );
  }
}
