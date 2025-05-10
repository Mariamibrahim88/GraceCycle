import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grace_cycle/core/utils/app_assets.dart';
import 'package:grace_cycle/core/utils/app_spacing.dart';
import 'package:grace_cycle/core/widgets/custom_app_bar.dart';
import 'package:grace_cycle/core/widgets/show_custom_dialog.dart';
import 'package:grace_cycle/features/details/presentation/views/widgets/container_of_image.dart';
import 'package:grace_cycle/features/details/presentation/views/widgets/custom_review_container.dart';
import 'package:grace_cycle/features/details/presentation/views/widgets/discount_container_for_details.dart';
import 'package:grace_cycle/features/details/presentation/views/widgets/fav_container.dart';
import 'package:grace_cycle/features/details/presentation/views/widgets/food_info.dart';
import 'package:grace_cycle/features/details/presentation/views/widgets/left_container.dart';
import 'package:grace_cycle/features/details/presentation/views/widgets/list_of_customer_reviews_section.dart';
import 'package:grace_cycle/features/details/presentation/views/widgets/rating_bar_widget.dart';
import 'package:grace_cycle/features/details/presentation/views/widgets/rating_linear_progress_indicator.dart';
import 'package:grace_cycle/features/details/presentation/views/widgets/title_and_icon.dart';

class FoodDetailsBody extends StatelessWidget {
  const FoodDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
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
                const FoodInfo(),
                verticalSpace(20),
                GestureDetector(
                  onTap: () {},
                  child: const TitleAndIcon(
                    title: 'Ratings and Reviews',
                  ),
                ),
                verticalSpace(5),
                Row(
                  children: [
                    const RatingBarWidget(),
                    RatingLinearProgressIndicator(),
                  ],
                ),
                verticalSpace(18),
                const ListOfCustomerReviewsSection(),
                GestureDetector(
                  child: const CustomReviewContainer(
                    title: 'Rate this Item',
                    leftPadding: 2,
                    rightPadding: 2,
                  ),
                  onTap: () {
                    showCustomDialog(
                        context,
                        'Sorry, you haven\'t tried this\nvendor yet, so you can\'t\nrate it',
                        AppAssets.haveNotVendor,
                        200.h);
                  },
                ),
                // const CustomReviewContainer(
                //   title: 'Rate this Item',
                //   leftPadding: 2,
                //   rightPadding: 2,
                // ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
