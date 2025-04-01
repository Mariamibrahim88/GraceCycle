import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grace_cycle/core/utils/app_colors.dart';
import 'package:grace_cycle/core/utils/app_spacing.dart';
import 'package:grace_cycle/features/home/presentation/views/widgets/discount_container.dart';
import 'package:grace_cycle/features/home/presentation/views/widgets/left_pieces_container.dart';
import 'package:grace_cycle/features/home/presentation/views/widgets/price_for_food.dart';
import 'package:grace_cycle/features/home/presentation/views/widgets/rate_container.dart';

class FavoriteFoodCard extends StatelessWidget {
  const FavoriteFoodCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.r),
      ),
      shadowColor: Colors.black38,
      color: AppColors.basicWhite,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              
              Image.asset(
                width: 150,
                height: 150,
                'assets/images/baked.jpg',
                fit: BoxFit.fill,
              ),
              Positioned(
                right: 5.r,
                top: 7.r,
                child: const RateContainer(rate: 4.5),
              ),
              Positioned(
                right: 5.r,
                top: 80.h,
                child: SizedBox(
                  width: 33.w,
                  height: 33.h,
                  child: DiscountContainer(fontSize: 13.sp, discount: 30),
                ),
              ),
            ],
          ),
          horizontalSpace(5.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Croissant',
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
              verticalSpace(9),
              Text(
                'Alsham bakery',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
              verticalSpace(6),
              const LeftPiecesContainer(
                  color: AppColors.sortColor, leftPieces: '0 left'),
              verticalSpace(7),
              const PriceForFood(
                price: false,
                oldPrice: 20,
                newPrice: 15,
              ),
            ],
          ),
          horizontalSpace(10.w),
          Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                'assets/images/cancel.png',
                fit: BoxFit.fill,
                width: 15,
                height: 18,
              ),
              const SizedBox(
                height: 80,
              ),
              const Icon(
                Icons.shopping_cart_outlined,
                color: AppColors.shoppingCart,
                size: 28,
              ),
            ],
          )
        ],
      ),
    );
  }
}
