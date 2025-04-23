import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grace_cycle/core/utils/app_colors.dart';
import 'package:grace_cycle/core/utils/app_spacing.dart';
import 'package:grace_cycle/core/utils/app_text_styles.dart';
import 'package:grace_cycle/features/details/presentation/views/widgets/price_food_for_details.dart';
import 'package:grace_cycle/features/details/presentation/views/widgets/row_of_remove_and_add.dart';
import 'package:grace_cycle/features/details/presentation/views/widgets/title_and_icon.dart';

class FoodInfo extends StatelessWidget {
  const FoodInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Baked Goods',
          style: AppTextStyles.nunito500Size14YellowDetails,
        ),
        verticalSpace(5),
        Row(
          children: [
            Text(
              'Sourdough Bread',
              style: AppTextStyles.nunito700Size20Black,
            ),
            horizontalSpace(5),
            Text(
              '(',
              style: AppTextStyles.nunito500Size16Black,
            ),
            Icon(
              Icons.star,
              color: AppColors.yellowForStar,
              size: 18.sp,
            ),
            Text(
              '4.5)',
              style: AppTextStyles.nunito500Size16Black,
            ),
          ],
        ),
        verticalSpace(5),
        const Row(
          children: [
            PriceFoodForDetails(
              oldPrice: 170,
              newPrice: 153,
            ),
            Spacer(),
            RowOfRemoveAndAdd(),
          ],
        ),
        verticalSpace(20),
        const TitleAndIcon(
          title: 'Vendor',
        ),
        verticalSpace(5),
        Text(
          'Al Shallal Restaurant',
          style: AppTextStyles.nunito400Size16Black,
        ),
        verticalSpace(5),
        Row(
          children: [
            Text(
              'from 10:00 AM to 12:00 AM',
              style: AppTextStyles.nunito400Size16Black,
            ),
            const Spacer(),
            Text(
              '5.7 km',
              style: AppTextStyles.nunito400Size16Black,
            )
          ],
        ),
        verticalSpace(10),
        Text(
          'Description',
          style: AppTextStyles.nunito500Size14YellowDetails,
        ),
        verticalSpace(5),
        Text(
          'Sourdough bread is a unique loaf known for its tangy flavor and chewy texture. Its made using a "starter," a live culture of wild yeast and bacteria. This natural fermentation process gives sourdough its distinct taste. The crust is often thick and crispy, while the inside is soft and airy',
          style: AppTextStyles.nunito400Size16Black,
        ),
      ],
    );
  }
}
