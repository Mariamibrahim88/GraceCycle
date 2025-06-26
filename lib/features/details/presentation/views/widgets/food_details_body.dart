import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grace_cycle/core/utils/app_assets.dart';
import 'package:grace_cycle/core/utils/app_spacing.dart';
import 'package:grace_cycle/core/widgets/custom_app_bar.dart';
import 'package:grace_cycle/core/widgets/show_custom_dialog.dart';
import 'package:grace_cycle/features/details/presentation/manager/cubit/details_cubit.dart';
import 'package:grace_cycle/features/details/presentation/views/widgets/container_of_image.dart';
import 'package:grace_cycle/features/details/presentation/views/widgets/custom_list_of_similar_food_item.dart';
import 'package:grace_cycle/features/details/presentation/views/widgets/custom_review_container.dart';
import 'package:grace_cycle/features/details/presentation/views/widgets/custom_shimmer_of_food_details.dart';
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
    return BlocBuilder<DetailsCubit, DetailsState>(
      buildWhen: (previous, current) =>
          current is! IncreaseQuantityState &&
          current is! DecreaseQuantityState,
      builder: (context, state) {
        if (state is GetFoodByIdLoading) {
          return const FoodDetailsShimmerBody();
        } else if (state is GetFoodByIdFailure) {
          return Center(child: Text(state.errorMessage));
        } else if (state is GetFoodByIdSuccess) {
          final foodItemDetailsModel = state.foodItemDetails;

          return SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    ContainerOfImage(
                      imageOfFood: foodItemDetailsModel.picUrl,
                    ),
                    CustomAppBar(
                      onPressed: () {
                        Navigator.pop(context, true);
                      },
                    ),
                    LeftContainer(
                      leftPieces: '${foodItemDetailsModel.quantity}+ left',
                    ),
                    FavContainer(
                      foodItem: foodItemDetailsModel,
                    ),
                    DiscountContainerForDetails(
                      discount: foodItemDetailsModel.discountPercentage,
                    ),
                  ],
                ),
                verticalSpace(20),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FoodInfo(
                        foodItemDetailsModel: foodItemDetailsModel,
                      ),
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
                          RatingBarWidget(
                            rating: foodItemDetailsModel.rating,
                          ),
                          RatingLinearProgressIndicator(
                            oneStar:
                                foodItemDetailsModel.reviewsSummary.oneStar,
                            twoStar:
                                foodItemDetailsModel.reviewsSummary.twoStars,
                            threeStar:
                                foodItemDetailsModel.reviewsSummary.threeStars,
                            fourStar:
                                foodItemDetailsModel.reviewsSummary.fourStars,
                            fiveStar:
                                foodItemDetailsModel.reviewsSummary.fiveStars,
                            totalReviews: foodItemDetailsModel
                                .reviewsSummary.totalReviews,
                          ),
                        ],
                      ),
                      verticalSpace(18),
                      ListOfCustomerReviewsSection(
                        foodItemDetailsModel: foodItemDetailsModel,
                      ),
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
                      verticalSpace(20),
                      const TitleAndIcon(
                        title: 'Similar Items',
                      ),
                      CustomListOfSimilarFoodItem(
                        foodItemDetailsModel: foodItemDetailsModel,
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        }
        return const FoodDetailsShimmerBody();
      },
    );
  }
}
