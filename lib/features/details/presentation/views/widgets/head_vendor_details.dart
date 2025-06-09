import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grace_cycle/core/utils/app_spacing.dart';
import 'package:grace_cycle/core/utils/app_text_styles.dart';
import 'package:grace_cycle/features/details/data/models/vendor_item_details_model.dart';
import 'package:grace_cycle/features/home/presentation/views/widgets/rate_container.dart';

class HeadVendorDetails extends StatelessWidget {
  const HeadVendorDetails({
    super.key, required this.vendorItemModel,
  });
  final VendorItemDetailsModel vendorItemModel;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        horizontalSpace(20.w),
        Text(vendorItemModel.displayName,
            style: AppTextStyles.nunito700Size20Black),
        Text(
          '(',
          style: AppTextStyles.nunito500Size16GreenButt.copyWith(
            fontSize: 20.sp,
          ),
        ),
        RateContainer(rate: vendorItemModel.rating),
        Text(
          ')',
          style: AppTextStyles.nunito500Size16GreenButt.copyWith(
            fontSize: 20.sp,
          ),
        ),
      ],
    );
  }
}
