import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grace_cycle/core/utils/app_assets.dart';
import 'package:grace_cycle/core/utils/app_colors.dart';
import 'package:grace_cycle/core/utils/app_spacing.dart';
import 'package:grace_cycle/core/utils/app_text_styles.dart';
import 'package:grace_cycle/features/orders/presentation/views/widgets/custom_receiving_address_container.dart';

class ReceiveSection extends StatelessWidget {
  const ReceiveSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Receiving  address',
            style: AppTextStyles.nunito700Size18Black,
          ),
          verticalSpace(10.h),
          CustomReceivingAddressContainer(
            asset: AppAssets.home,
            text: 'Receiving from branch',
            index: 0,
          ),
          verticalSpace(10),
          CustomReceivingAddressContainer(
            asset: AppAssets.location,
            text: 'Egypt, cairo , Giza',
            index: 1,
          ),
          verticalSpace(10),
          Container(
            height: 46.h,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.r),
                border: Border.all(
                  color: AppColors.greenButt,
                  width: 1,
                )),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: Row(
                children: [
                  const Icon(
                    Icons.add_circle_outline,
                    color: AppColors.greenButt,
                    size: 30,
                  ),
                  horizontalSpace(5),
                  Text('Add new address',
                      style: AppTextStyles.nunito400Size16Black),
                ],
              ),
            ),
          ),
          verticalSpace(50),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('Payment summary',
                  style: AppTextStyles.nunito700Size22GreenButt),
              verticalSpace(15.h),
              Row(
                children: [
                  Text('Delivery fee',
                      style: AppTextStyles.nunito500Size18Black),
                  const Spacer(),
                  Text('EGP 20', style: AppTextStyles.nunito500Size18Black),
                ],
              ),
              verticalSpace(10.h),
              Row(
                children: [
                  Text('Subtotal', style: AppTextStyles.nunito500Size18Black),
                  const Spacer(),
                  Text('EGP 20', style: AppTextStyles.nunito500Size18Black),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
