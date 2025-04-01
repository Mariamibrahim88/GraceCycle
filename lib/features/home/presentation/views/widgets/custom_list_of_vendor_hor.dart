import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grace_cycle/features/home/data/models/vendors_model.dart';
import 'package:grace_cycle/features/home/presentation/views/widgets/header_of_vendor_name.dart';
import 'package:grace_cycle/features/home/presentation/views/widgets/vendor_card.dart';

class CustomListOfVendorHor extends StatelessWidget {
  const CustomListOfVendorHor({
    super.key,
    required this.vendor,
    required this.vendorCategory,
  });
  final List<VendorItemModel> vendor;
  final String vendorCategory;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HeaderOfVendorName(
          title: vendorCategory,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
          child: Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 293.h,
                  child: ListView.builder(
                    itemCount: vendor.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => VendorCard(
                      vendorItemModel: vendor[index],
                    ),
                    // itemCount: vendor.length,
                  ),
                ),
              )
            ],

            // children: List.generate(
            //   vendor.length,
            //   (index) => Padding(
            //     padding: EdgeInsets.symmetric(horizontal: 5.w),
            //     child: VendorCard(
            //       vendorItemModel: vendor[index],

            //     ),
            //   ),
            // ),
          ),
        ),
      ],
    );
  }
}
