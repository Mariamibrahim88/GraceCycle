import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grace_cycle/core/routes/app_routes.dart';
import 'package:grace_cycle/core/utils/app_assets.dart';
import 'package:grace_cycle/core/utils/app_colors.dart';
import 'package:grace_cycle/core/utils/app_navigate.dart';
import 'package:grace_cycle/core/utils/app_spacing.dart';
import 'package:grace_cycle/core/utils/app_text_styles.dart';
import 'package:grace_cycle/features/orders/data/models/order_summary_model.dart';

class ItemOfOrder extends StatelessWidget {
  const ItemOfOrder({
    super.key,
    required this.orderSummary,
  });

  final OrderSummaryModel orderSummary;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        navigate(
          context: context,
          route: Routes.checkout,
          arg: orderSummary.id,
        );

        // context.read<CheckoutCubit>().getOrderDetails(
        //       orderId: orderSummary.id,
        //     );
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
                children: [
                  Text(
                    orderSummary.vendorName,
                    style: AppTextStyles.nunito700Size16Black,
                  ),
                  Text('(${orderSummary.orderDate})',
                      style: AppTextStyles.nunito500Size12Black),
                  const Spacer(),
                  const Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 14,
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
                        '${orderSummary.itemsCount} items',
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
                        (orderSummary.total).toStringAsFixed(2),
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
