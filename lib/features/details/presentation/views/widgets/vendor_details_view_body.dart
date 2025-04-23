import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grace_cycle/core/utils/app_colors.dart';
import 'package:grace_cycle/core/utils/app_spacing.dart';
import 'package:grace_cycle/features/details/presentation/views/widgets/custom_forward_arrow.dart';
import 'package:grace_cycle/features/details/presentation/views/widgets/custom_review_container.dart';
import 'package:grace_cycle/features/details/presentation/views/widgets/head_vendor_details.dart';
import 'package:grace_cycle/features/details/presentation/views/widgets/icon_data_vendor_details.dart';
import 'package:grace_cycle/features/details/presentation/views/widgets/items_offered_section.dart';
import 'package:grace_cycle/features/details/presentation/views/widgets/vendor_details_card.dart';
import 'package:grace_cycle/features/details/presentation/views/widgets/yellow_title.dart';
import 'package:grace_cycle/features/home/data/models/vendors_model.dart';
import 'package:grace_cycle/features/home/presentation/views/widgets/vendor_card.dart';

class VendorDetailsViewBody extends StatelessWidget {
  const VendorDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const VendorDetailsCard(),
          verticalSpace(15.h),
          const HeadVendorDetails(),
          verticalSpace(5.h),
          const ContainerVendorIconDataDetails(
            icon: Icons.location_on_outlined,
            text: 'Ahmed Hassan Al-Bakoury Street',
          ),
          verticalSpace(5.h),
          const ContainerVendorIconDataDetails(
            icon: Icons.access_time,
            text: 'Open from 10:00 AM to 12:00 AM',
          ),
          verticalSpace(5.h),
          const ContainerVendorIconDataDetails(
            icon: Icons.near_me_outlined,
            text: 'It is 10 km away from you',
          ),
          verticalSpace(15.h),
          const ItemsOfferedSection(),
          const CustomReviewContainer(),
          verticalSpace(20.h),
          Padding(
            padding: EdgeInsets.only(
              left: 30,
              right: 30,
              bottom: 20.h,
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                YellowTitle(
                  title: 'Similar Restaurant',
                ),
                CustomForwardArrow(
                  color: AppColors.yellowForDetails,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
