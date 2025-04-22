import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grace_cycle/core/utils/app_colors.dart';
import 'package:grace_cycle/core/utils/app_spacing.dart';
import 'package:grace_cycle/core/utils/app_text_styles.dart';
import 'package:grace_cycle/core/widgets/custom_app_bar.dart';
import 'package:grace_cycle/features/details/presentation/views/widgets/container_of_image.dart';
import 'package:grace_cycle/features/details/presentation/views/widgets/discount_container_for_details.dart';
import 'package:grace_cycle/features/details/presentation/views/widgets/fav_container.dart';
import 'package:grace_cycle/features/details/presentation/views/widgets/left_container.dart';
import 'package:grace_cycle/features/details/presentation/views/widgets/price_food_for_details.dart';
import 'package:grace_cycle/features/details/presentation/views/widgets/row_of_remove_and_add.dart';

class FoodDetailsBody extends StatelessWidget {
  const FoodDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            const ContainerOfImage(),
            CustomAppBar(
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            const LeftContainer(),
            const FavContainer(),
            const DiscountContainerForDetails(),
          ],
        ),
        verticalSpace(20),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
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
              Row(
                children: [
                  Text(
                    'Vendor',
                    style: AppTextStyles.nunito500Size14YellowDetails,
                  ),
                  const Spacer(),
                  Icon(Icons.arrow_forward_ios,
                      color: AppColors.yellowForDetails, size: 18.sp),
                ],
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
              )
            ],
          ),
        )
      ],
    );
  }
}
