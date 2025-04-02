import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grace_cycle/core/widgets/custom_shimmer_image.dart';

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
        child: CachedNetworkImage(
          imageUrl: foodImage,
          fit: BoxFit.cover,
          placeholder: (context, url) => CustomShimmerImage(
            height: 137.h,
            width: 278.w,
          ),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
      ),
    );
  }
}
