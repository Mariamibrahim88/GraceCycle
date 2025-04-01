import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class CustomShimmerImage extends StatelessWidget {
  const CustomShimmerImage({
    super.key,
    required this.height,
  });
  final double height;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        height: 137.h,
        width: MediaQuery.of(context).size.isFinite ? 0.7.sw : 0.7.sw,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16.r)),
          color: Colors.white,
        ),
      ),
    );
  }
}
