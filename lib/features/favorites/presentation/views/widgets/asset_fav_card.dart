import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grace_cycle/core/widgets/custom_shimmer_image.dart';

class AssetFavCard extends StatelessWidget {
  const AssetFavCard({
    super.key,
    required this.imageUrl,
  });

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90.h,
      width: 110.w,
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
        imageUrl: optimizeCloudinaryImage(
          url: imageUrl,
          width: 110.w.toInt(),
          height: 90.h.toInt(),
          quality: 90,
        ),
        placeholder: (context, url) => CustomShimmerImage(
          height: 95.h,
          width: 110.w,
        ),
        errorWidget: (context, url, error) =>
            const Center(child: Icon(Icons.error)),
      ),
    );
  }
}

String optimizeCloudinaryImage({
  required String url,
  int width = 400,
  int height = 300,
  int quality = 90,
}) {
  const segment = '/upload/';

  if (!url.contains(segment)) return url;

  final transformation = 'w_$width,h_$height,c_fill,q_$quality,f_auto';

  return url.replaceFirst(segment, '$segment$transformation/');
}
