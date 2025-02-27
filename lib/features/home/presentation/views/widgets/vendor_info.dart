import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grace_cycle/core/utils/app_spacing.dart';

class VendorInfo extends StatelessWidget {
  const VendorInfo({
    super.key,
    required this.vendorName,
    required this.vendorAddress,
    required this.vendorTime,
    required this.vendorDistance,
    required this.vendorLogo,
  });
  final String vendorName;
  final String vendorAddress;
  final String vendorTime;
  final String vendorDistance;
  final String vendorLogo;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.isFinite ? 0.7.sw : 0.7.sw,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              vendorName,
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
            CircleAvatar(
              radius: 20.r,
              backgroundImage: AssetImage(vendorLogo),
            )
          ]),
          Text(
            vendorAddress,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
          ),
          verticalSpace(5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                vendorTime,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.black54,
                ),
              ),
              Text(
                vendorDistance,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
