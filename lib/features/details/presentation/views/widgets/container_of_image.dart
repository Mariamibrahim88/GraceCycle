import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grace_cycle/core/utils/app_colors.dart';

class ContainerOfImage extends StatelessWidget {
  const ContainerOfImage({super.key, required this.imageOfFood});

  final String imageOfFood;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.vendorCard,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30.r),
          bottomRight: Radius.circular(30.r),
        ),
      ),
      child: Padding(
        padding:
            EdgeInsets.only(top: 52.h, left: 25.w, right: 25.w, bottom: 20.h),
        child: ClipRRect(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(30.r),
            bottom: Radius.circular(30.r),
          ),
          child: SizedBox(
              height: 323.h,
              width: 161.w,
              child: CachedNetworkImage(
                imageUrl: imageOfFood,
                fit: BoxFit.cover,
                placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(
                  color: AppColors.greenButt,
                )),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              )),
        ),
      ),
    );
  }
}
