import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grace_cycle/core/widgets/custom_shimmer_image.dart';

class AssetOfVendor extends StatelessWidget {
  const AssetOfVendor({
    super.key,
    required this.picUrl,
  });
  final String picUrl;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(16.r)),
        child: CachedNetworkImage(
          imageBuilder: (context, imageProvider) => Container(
            height: 137.h,
            width: MediaQuery.of(context).size.isFinite ? 0.7.sw : 0.7.sw,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(16.r)),
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.cover,
              ),
            ),
          ),
          imageUrl: optimizeCloudinaryImage(
            url: picUrl,
          ),
          placeholder: (context, url) => CustomShimmerImage(
            height: 137.h,
            width: MediaQuery.of(context).size.isFinite ? 0.7.sw : 0.7.sw,
          ),
          errorWidget: (context, url, error) =>
              const Center(child: Icon(Icons.error)),
        ),
      ),
    );
  }
}

String optimizeCloudinaryImage({
  required String url,
  int width = 150,
  int height = 150,
  String quality = 'q_80:good',
}) {
  const segment = '/upload/';

  if (!url.contains(segment)) return url;

  final transformation = 'w_$width,h_$height,c_fill,$quality,q_80';

  return url.replaceFirst(segment, '$segment$transformation/');
}
