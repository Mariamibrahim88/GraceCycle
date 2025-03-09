import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grace_cycle/core/utils/app_assets.dart';
import 'package:grace_cycle/features/home/presentation/views/widgets/food_card.dart';
import 'package:grace_cycle/features/home/presentation/views/widgets/vendor_card.dart';

class CustomListOfVendorVer extends StatelessWidget {
  const CustomListOfVendorVer({
    super.key,
    required this.foodTitle,
    required this.foodAsset,
  });

  final String foodTitle;
  final String foodAsset;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20.w,
        ),
        child: Column(
          children: List.generate(
            5,
            (index) => Padding(
              padding: EdgeInsets.symmetric(vertical: 4.w),
              child: VendorCard(
                vendorAddress: 'AhmedHassan Al-Bakoury St, Nasr City',
                vendorName: 'Al Shallal',
                vendorImage: AppAssets.restaurant,
                vendorTime: '10:00 AM - 12:00 PM',
                vendorDistance: '1.2 km',
                vendorLogo: AppAssets.restauratLogo,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
