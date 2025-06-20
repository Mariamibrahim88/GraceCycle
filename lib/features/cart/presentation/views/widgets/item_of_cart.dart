import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grace_cycle/core/routes/app_routes.dart';
import 'package:grace_cycle/core/utils/app_assets.dart';
import 'package:grace_cycle/core/utils/app_colors.dart';
import 'package:grace_cycle/core/utils/app_spacing.dart';
import 'package:grace_cycle/core/utils/app_text_styles.dart';
import 'package:grace_cycle/features/cart/data/models/cart_items_for_any_vendor_model.dart';

class ItemOfCart extends StatelessWidget {
  const ItemOfCart({
    super.key,
    required this.cartItemsForAnyVendorModel,
  });
  final CartItemsForAnyVendorModel cartItemsForAnyVendorModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, Routes.cartFull,
            arguments: cartItemsForAnyVendorModel.vendorId);
      },
      child: Container(
        height: 73.h,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          color: AppColors.cardofCart,
          border: Border.all(
            color: AppColors.basicGreen,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    cartItemsForAnyVendorModel.vendorName,
                    style: AppTextStyles.nunito800Size18Black,
                  ),
                  Text(
                    ' (${cartItemsForAnyVendorModel.createdAt.year.toString()}/${cartItemsForAnyVendorModel.createdAt.month.toString().padLeft(2, '0')}/${cartItemsForAnyVendorModel.createdAt.day.toString().padLeft(2, '0')})',
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 25,
                  ),
                ],
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    height: 25.h,
                    width: 64.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      color: AppColors.basicGreen,
                    ),
                    child: Center(
                      child: Text(
                        '${cartItemsForAnyVendorModel.count.toString()} items',
                        style: AppTextStyles.nunito500Size14Black
                            .copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                  const Spacer(),
                  SvgPicture.asset(
                    AppAssets.money,
                    height: 24.h,
                    width: 24.w,
                  ),
                  horizontalSpace(8.w),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        'total: ',
                        style: AppTextStyles.nunito500Size17GreenButt,
                      ),
                      Text(
                        'EGP',
                        style: AppTextStyles.nunito500Size11BasicGreen,
                      ),
                      Text(
                        cartItemsForAnyVendorModel.total.toString(),
                        style: AppTextStyles.nunito500Size17GreenButt,
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
