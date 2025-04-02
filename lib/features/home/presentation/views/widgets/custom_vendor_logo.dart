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
      imageUrl: logoUrl,
      imageBuilder: (context, imageProvider) => Container(
        width: 35.w,
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
