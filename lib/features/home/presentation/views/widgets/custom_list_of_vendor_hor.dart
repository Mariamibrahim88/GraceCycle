import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grace_cycle/features/home/presentation/views/widgets/vendor_card.dart';

class CustomListOfVendorHor extends StatelessWidget {
  const CustomListOfVendorHor({
    super.key,
    required this.vendorName,
    required this.vendorAddress,
    required this.vendorTime,
    required this.vendorDistance,
    required this.vendorLogo,
    required this.vendorImage,
  });
  final String vendorName;
  final String vendorAddress;
  final String vendorTime;
  final String vendorDistance;
  final String vendorLogo;
  final String vendorImage;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: Row(
          children: List.generate(
            5,
            (index) => Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: VendorCard(
                vendorName: vendorName,
                vendorAddress: vendorAddress,
                vendorTime: vendorTime,
                vendorDistance: vendorDistance,
                vendorLogo: vendorLogo,
                vendorImage: vendorImage,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
