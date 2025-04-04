import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomVendorLogo extends StatelessWidget {
  const CustomVendorLogo({
    super.key,
    required this.logoUrl,
  });
  final String logoUrl;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: optimizeCloudinaryImage(url: logoUrl),
      imageBuilder: (context, imageProvider) => Container(
        width: 33.w,
        height: 30.h,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(50)),
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.fill,
          ),
        ),
      ),
      placeholder: (context, url) => const Center(
          child: CircularProgressIndicator(
        color: Colors.green,
      )),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}

String optimizeCloudinaryImage({
  required String url,
  int width = 200,
  int height = 200,
}) {
  const segment = '/upload/';

  if (!url.contains(segment)) return url;

  final transformation = 'w_$width,h_$height,c_fill,q_80,f_auto';

  return url.replaceFirst(segment, '$segment$transformation/');
}
