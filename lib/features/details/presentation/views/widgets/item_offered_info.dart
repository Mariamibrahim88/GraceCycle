import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grace_cycle/core/utils/app_colors.dart';
import 'package:grace_cycle/core/utils/app_spacing.dart';
import 'package:grace_cycle/features/home/presentation/views/widgets/left_pieces_container.dart';
import 'package:grace_cycle/features/home/presentation/views/widgets/price_for_food.dart';

class ItemOfferedInfo extends StatelessWidget {
  const ItemOfferedInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          'Apple Pie',
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
        verticalSpace(12),
        const PriceForFood(
          price: false,
          oldPrice: 40,
          newPrice: 10,
        ),
        verticalSpace(7),
        LeftPiecesContainer(
            color: AppColors.sortColor, leftPieces: '${5.toString()} + left'),
      ],
    );
  }
}
