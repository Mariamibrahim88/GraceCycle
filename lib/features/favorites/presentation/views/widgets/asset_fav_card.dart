import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grace_cycle/core/widgets/custom_shimmer_image.dart';

class AssetFavCard extends StatelessWidget {
  const AssetFavCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 115.h,
      width: 130.w,
      child: CachedNetworkImage(
        imageBuilder: (context, imageProvider) => Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(16.r)),
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.fill,
            ),
          ),
        ),
        imageUrl:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Hamburger_%2812164386105%29.jpg/1200px-Hamburger_%2812164386105%29.jpg',
        placeholder: (context, url) => CustomShimmerImage(
          height: 115.h,
          width: 130.w,
        ),
        errorWidget: (context, url, error) =>
            const Center(child: Icon(Icons.error)),
      ),
    );
  }
}
