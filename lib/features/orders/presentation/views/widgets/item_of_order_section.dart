import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grace_cycle/core/utils/app_colors.dart';
import 'package:grace_cycle/core/utils/app_spacing.dart';
import 'package:grace_cycle/core/utils/app_text_styles.dart';
import 'package:grace_cycle/features/cart/data/models/update_item_model.dart';
import 'package:grace_cycle/features/cart/presentation/views/widgets/remove_and_add_cart_item.dart';
import 'package:grace_cycle/features/favorites/presentation/views/widgets/asset_fav_card.dart';
import 'package:grace_cycle/features/home/presentation/views/widgets/left_pieces_container.dart';
import 'package:grace_cycle/features/home/presentation/views/widgets/price_for_food.dart';
import 'package:grace_cycle/features/orders/data/models/order_details_model.dart';

class ItemOfOrderSection extends StatelessWidget {
  const ItemOfOrderSection({
    super.key,
    required this.orderItem,
  });
  final OrderItem orderItem;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.r),
      ),
      shadowColor: Colors.black38,
      color: AppColors.basicWhite,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AssetFavCard(imageUrl: orderItem.picUrl),
          horizontalSpace(8.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                orderItem.productName,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
              verticalSpace(12),
              PriceForFood(
                price: false,
                oldPrice: orderItem.originalPrice,
                newPrice: orderItem.price,
              ),
              verticalSpace(7),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  LeftPiecesContainer(
                    color: AppColors.sortColor,
                    leftPieces: orderItem.stockLeft,
                  ),
                  horizontalSpace(35.w),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: AppColors.secondgreenButt,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        Text(
                          'You ِadded ',
                          style: AppTextStyles.nunito700Size16Black,
                        ),
                        Text(
                          '${orderItem.quantity}',
                          style: AppTextStyles.nunito700Size16Black.copyWith(
                            color: AppColors.basicGreen,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          // Column(
          //   crossAxisAlignment: CrossAxisAlignment.end,
          //   children: [
          //     GestureDetector(
          //       onTap: () {
          //         final updatedItem = CartItemForUpdate(
          //           id: orderItem.productId,
          //           name: orderItem.productName,
          //           quantity: 0,
          //           available: orderItem.stockLeft,
          //           picUrl: orderItem.picUrl,
          //           unitPrice: orderItem.originalPrice,
          //           newPrice: orderItem.price,
          //         );

          //         // context.read<CartCubit>().updateCartForVendor(
          //         //       vendorId: vendorId,
          //         //       item: updatedItem,
          //         //     );
          //       },
          //       child: const Icon(
          //         Icons.close_sharp,
          //         size: 22,
          //         color: AppColors.redForPrice,
          //       ),
          //     ),
          //     verticalSpace(30.h),
          // RemoveAndAddCartItem(
          //   cartItem: cartItem,
          //   vendorId: vendorId,
          // ),
          //   ],
          // ),
        ],
      ),
    );
  }
}
