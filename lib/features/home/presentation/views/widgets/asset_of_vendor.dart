import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AssetOfVendor extends StatelessWidget {
  const AssetOfVendor({
    super.key,
    required this.vendorImage,
  });
  final String vendorImage;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(16.r)),
        child: Image(
          image: AssetImage(vendorImage),
          height: 130.h,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
