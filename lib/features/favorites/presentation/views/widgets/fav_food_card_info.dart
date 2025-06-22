import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grace_cycle/core/utils/app_colors.dart';
import 'package:grace_cycle/core/utils/app_spacing.dart';
import 'package:grace_cycle/features/favorites/data/models/fav_food_model.dart';
import 'package:grace_cycle/features/home/presentation/views/widgets/left_pieces_container.dart';
import 'package:grace_cycle/features/home/presentation/views/widgets/price_for_food.dart';

class FavFoodCardInfo extends StatelessWidget {
  const FavFoodCardInfo({
    super.key,
    required this.foodItem,
  });

  final FoodItem foodItem;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          foodItem.name,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
        verticalSpace(9),
        Text(
          foodItem.vName,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
        ),
        verticalSpace(6),
        LeftPiecesContainer(
            color: AppColors.sortColor,
            leftPieces: foodItem.quantity),
        verticalSpace(7),
        PriceForFood(
          price: false,
          oldPrice: foodItem.unitPrice,
          newPrice: foodItem.newPrice,
        ),
      ],
    );
  }
}
