import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grace_cycle/core/utils/app_colors.dart';
import 'package:grace_cycle/core/utils/app_spacing.dart';
import 'package:grace_cycle/features/home/presentation/views/widgets/asset_of_food.dart';
import 'package:grace_cycle/features/home/presentation/views/widgets/discount_container.dart';
import 'package:grace_cycle/features/home/presentation/views/widgets/dotted_line.dart';
import 'package:grace_cycle/features/home/presentation/views/widgets/favourite_container.dart';
import 'package:grace_cycle/features/home/presentation/views/widgets/left_pieces_container.dart';
import 'package:grace_cycle/features/home/presentation/views/widgets/price_for_food.dart';
import 'package:grace_cycle/features/home/presentation/views/widgets/rate_container.dart';

class FoodCard extends StatelessWidget {
  const FoodCard({super.key, required this.foodName, required this.foodImage});

  final String foodName;
  final String foodImage;

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
                        foodImage: foodImage,
                      ),
                      Positioned(
                        top: 10.h,
                        left: 10.w,
                        right: 10.w,
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            LeftPiecesContainer(),
                            RateContainer(),
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
                              foodName,
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
                          'Al Shallal Restaurant',
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
                              'from 10:00 AM to 12:00 AM',
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
                        const PriceForFood(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const FavouriteContainer(),
          const DiscountContainer(),
        ],
      ),
    );
  }
}
