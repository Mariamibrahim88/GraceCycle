import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grace_cycle/core/utils/app_colors.dart';
import 'package:grace_cycle/core/utils/app_spacing.dart';
import 'package:grace_cycle/features/details/data/models/vendor_item_details_model.dart';
import 'package:grace_cycle/features/details/presentation/views/widgets/custom_forward_arrow.dart';
import 'package:grace_cycle/features/details/presentation/views/widgets/item_offered_info.dart';
import 'package:grace_cycle/features/favorites/presentation/views/widgets/asset_fav_card.dart';

class ItemOfferedCard extends StatelessWidget {
  const ItemOfferedCard({
    super.key, required this.offeredItem,
  });
  final OfferedItem offeredItem;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 26.w,
        vertical: 2.h,
      ),
      child: Card(
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
            AssetFavCard(
              imageUrl: offeredItem.picUrl,
            ),
            horizontalSpace(15.w),
            ItemOfferedInfo(
              offeredItem: offeredItem,
            ),
            horizontalSpace(20.w),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomForwardArrow(),
                verticalSpace(45.h),

                // FavIconForFood(
                //   foodItem: favFoodModel,
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
