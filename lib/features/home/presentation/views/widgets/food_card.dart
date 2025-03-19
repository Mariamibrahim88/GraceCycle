import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grace_cycle/core/utils/app_assets.dart';
import 'package:grace_cycle/core/utils/app_colors.dart';
import 'package:grace_cycle/core/utils/app_spacing.dart';
import 'package:grace_cycle/features/home/data/models/food_menu_model.dart';
import 'package:grace_cycle/features/home/presentation/views/widgets/asset_of_food.dart';
import 'package:grace_cycle/features/home/presentation/views/widgets/discount_container.dart';
import 'package:grace_cycle/features/home/presentation/views/widgets/dotted_line.dart';
import 'package:grace_cycle/features/home/presentation/views/widgets/favourite_container.dart';
import 'package:grace_cycle/features/home/presentation/views/widgets/left_pieces_container.dart';
import 'package:grace_cycle/features/home/presentation/views/widgets/price_for_food.dart';
import 'package:grace_cycle/features/home/presentation/views/widgets/rate_container.dart';

class FoodCard extends StatelessWidget {
  const FoodCard({super.key, required this.foodItemModel});

  final FoodItemModel foodItemModel;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          SizedBox(
            height: 293.h,
            width: 280.w,
            child: Card(
              elevation: 2,
              color: AppColors.foodCard,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      AssetOfFood(
                        foodImage: foodItemModel.picUrl,
                      ),
                      Positioned(
                        top: 10.h,
                        left: 10.w,
                        right: 10.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            LeftPiecesContainer(
                              leftPieces: '${foodItemModel.quantity}+ left',
                            ),
                            RateContainer(
                              rate: foodItemModel.rating,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  verticalSpace(10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              foodItemModel.name,
                              style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w700,
                                color: Colors.black,
                              ),
                            ),
                            const Icon(
                              Icons.shopping_cart_outlined,
                              color: AppColors.shoppingCart,
                              size: 28,
                            ),
                          ],
                        ),
                        verticalSpace(15),
                        Text(
                          foodItemModel.vName,
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ),
                        verticalSpace(8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${foodItemModel.vOpening} to ${foodItemModel.vClosing}',
                              //'from 10:00 AM to 12:00 AM',
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                color: Colors.black54,
                              ),
                            ),
                            Text(
                              '5.7 km',
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        verticalSpace(10),
                        const DottLine(),
                        verticalSpace(10),
                        PriceForFood(
                          oldPrice: foodItemModel.unitPrice,
                          newPrice: foodItemModel.newPrice,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const FavouriteContainer(),
          DiscountContainer(
            discount: foodItemModel.discountPercentage,
          ),
        ],
      ),
    );
  }
}

class FooddCard extends StatelessWidget {
  const FooddCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          SizedBox(
            height: 293.h,
            width: 280.w,
            child: Card(
              elevation: 2,
              color: AppColors.foodCard,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      AssetOfFood(
                        foodImage: AppAssets.healthy,
                      ),
                      Positioned(
                        top: 10.h,
                        left: 10.w,
                        right: 10.w,
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            LeftPiecesContainer(
                              leftPieces: '5+ left',
                            ),
                            RateContainer(
                              rate: 4.5,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  verticalSpace(10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Healthy Food',
                              style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w700,
                                color: Colors.black,
                              ),
                            ),
                            const Icon(
                              Icons.shopping_cart_outlined,
                              color: AppColors.shoppingCart,
                              size: 28,
                            ),
                          ],
                        ),
                        verticalSpace(15),
                        Text(
                          'Ala Carte',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ),
                        verticalSpace(8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '10:00 AM to 12:00 AM',
                              //'from 10:00 AM to 12:00 AM',
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                color: Colors.black54,
                              ),
                            ),
                            Text(
                              '5.7 km',
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        verticalSpace(10),
                        const DottLine(),
                        verticalSpace(10),
                        const PriceForFood(
                          oldPrice: 20,
                          newPrice: 15,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const FavouriteContainer(),
          const DiscountContainer(
            discount: 10,
          ),
        ],
      ),
    );
  }
}
