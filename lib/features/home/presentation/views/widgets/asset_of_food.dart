import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AssetOfFood extends StatelessWidget {
  const AssetOfFood({super.key, required this.foodImage});

  final String foodImage;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.vertical(top: Radius.circular(15.r)),
      child: SizedBox(
        height: 137.h,
        width: 278.w,
        child: Image.asset(
          foodImage,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
