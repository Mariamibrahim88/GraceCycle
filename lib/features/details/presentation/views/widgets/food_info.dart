import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grace_cycle/core/utils/app_colors.dart';
import 'package:grace_cycle/core/utils/app_spacing.dart';
import 'package:grace_cycle/core/utils/app_text_styles.dart';
import 'package:grace_cycle/features/details/data/models/food_item_details_model.dart';
import 'package:grace_cycle/features/details/presentation/views/widgets/price_food_for_details.dart';
import 'package:grace_cycle/features/details/presentation/views/widgets/row_of_remove_and_add.dart';
import 'package:grace_cycle/features/details/presentation/views/widgets/title_and_icon.dart';

class FoodInfo extends StatelessWidget {
  const FoodInfo({super.key, required this.foodItemDetailsModel});

  final FoodItemDetailsModel foodItemDetailsModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          foodItemDetailsModel.categories.first,
          style: AppTextStyles.nunito500Size14YellowDetails,
        ),
        verticalSpace(5),
        Row(
          children: [
            Text(
              foodItemDetailsModel.name,
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
              '${foodItemDetailsModel.rating})',
              style: AppTextStyles.nunito500Size16Black,
            ),
          ],
        ),
        verticalSpace(5),
        Row(
          children: [
            PriceFoodForDetails(
              oldPrice: foodItemDetailsModel.unitPrice,
              newPrice: foodItemDetailsModel.newPrice,
            ),
            const Spacer(),
            RowOfRemoveAndAdd(
              foodItemDetailsModel: foodItemDetailsModel,
            ),
          ],
        ),
        verticalSpace(20),
        const TitleAndIcon(
          title: 'Vendor',
        ),
        verticalSpace(5),
        Text(
          foodItemDetailsModel.vName,
          style: AppTextStyles.nunito400Size16Black,
        ),
        verticalSpace(5),
        Row(
          children: [
            Text(
              foodItemDetailsModel.operatingHours,
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
          foodItemDetailsModel.description,
          style: AppTextStyles.nunito400Size16Black,
        ),
      ],
    );
  }
}
