import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grace_cycle/core/utils/app_colors.dart';
import 'package:grace_cycle/core/utils/app_spacing.dart';
import 'package:grace_cycle/features/cart/data/models/cart_items_for_specefic_vendor_model.dart';
import 'package:grace_cycle/features/cart/data/models/update_item_model.dart';
import 'package:grace_cycle/features/cart/presentation/manager/cubit/cart_cubit.dart';
import 'package:grace_cycle/features/cart/presentation/views/widgets/remove_and_add_cart_item.dart';
import 'package:grace_cycle/features/favorites/presentation/views/widgets/asset_fav_card.dart';
import 'package:grace_cycle/features/home/presentation/views/widgets/left_pieces_container.dart';
import 'package:grace_cycle/features/home/presentation/views/widgets/price_for_food.dart';

class FoodCardInfullCart extends StatelessWidget {
  const FoodCardInfullCart({
    super.key,
    required this.cartItem,
    required this.vendorId,
  });

  final CartItem cartItem;
  final String vendorId;

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
          AssetFavCard(imageUrl: cartItem.picUrl),
          horizontalSpace(15.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                cartItem.name,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
              verticalSpace(12),
              PriceForFood(
                price: false,
                oldPrice: cartItem.unitPrice,
                newPrice: cartItem.newPrice,
              ),
              verticalSpace(7),
              LeftPiecesContainer(
                color: AppColors.sortColor,
                leftPieces: cartItem.available,
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {
                  final updatedItem = CartItemForUpdate(
                    id: cartItem.id,
                    name: cartItem.name,
                    quantity: 0,
                    available: cartItem.available,
                    picUrl: cartItem.picUrl,
                    unitPrice: cartItem.unitPrice,
                    newPrice: cartItem.newPrice,
                  );

                  context.read<CartCubit>().updateCartForVendor(
                        vendorId: vendorId,
                        item: updatedItem,
                      );
                },
                child: const Icon(
                  Icons.close_sharp,
                  size: 22,
                  color: AppColors.redForPrice,
                ),
              ),
              verticalSpace(30.h),
              RemoveAndAddCartItem(
                cartItem: cartItem,
                vendorId: vendorId,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
