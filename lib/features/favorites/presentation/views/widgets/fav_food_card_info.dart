import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grace_cycle/core/utils/app_colors.dart';
import 'package:grace_cycle/core/utils/app_spacing.dart';
import 'package:grace_cycle/features/home/presentation/views/widgets/left_pieces_container.dart';
import 'package:grace_cycle/features/home/presentation/views/widgets/price_for_food.dart';

class FavFoodCardInfo extends StatelessWidget {
  const FavFoodCardInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}
