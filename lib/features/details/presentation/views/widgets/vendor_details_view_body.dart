import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grace_cycle/core/utils/app_spacing.dart';
import 'package:grace_cycle/features/details/presentation/views/widgets/head_vendor_details.dart';
import 'package:grace_cycle/features/details/presentation/views/widgets/icon_data_vendor_details.dart';
import 'package:grace_cycle/features/details/presentation/views/widgets/item_offer_card.dart';
import 'package:grace_cycle/features/details/presentation/views/widgets/vendor_details_card.dart';
import 'package:grace_cycle/features/details/presentation/views/widgets/yellow_title.dart';

class VendorDetailsViewBody extends StatelessWidget {
  const VendorDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const VendorDetailsCard(),
          const HeadVendorDetails(),
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
          const YellowTitle(
            title: 'Items Offered',
          ),
          const ItemOfferedCard(),
        ],
      ),
    );
  }
}
