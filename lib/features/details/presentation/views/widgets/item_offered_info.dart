import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grace_cycle/core/utils/app_colors.dart';
import 'package:grace_cycle/core/utils/app_spacing.dart';
import 'package:grace_cycle/features/details/data/models/vendor_item_details_model.dart';
import 'package:grace_cycle/features/home/presentation/views/widgets/left_pieces_container.dart';
import 'package:grace_cycle/features/home/presentation/views/widgets/price_for_food.dart';

class ItemOfferedInfo extends StatelessWidget {
  const ItemOfferedInfo({
    super.key,
    required this.offeredItem,
  });
  final OfferedItem offeredItem;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          offeredItem.name,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
        verticalSpace(12),
        PriceForFood(
          price: false,
          oldPrice: offeredItem.unitPrice,
          newPrice: offeredItem.newPrice,
        ),
        verticalSpace(7),
        LeftPiecesContainer(
            color: AppColors.sortColor,
            leftPieces: '${offeredItem.quantity} + left'),
      ],
    );
  }
}
