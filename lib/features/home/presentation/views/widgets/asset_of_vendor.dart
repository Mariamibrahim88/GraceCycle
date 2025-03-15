import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grace_cycle/features/home/data/models/vendors_model.dart';

class AssetOfVendor extends StatelessWidget {
  const AssetOfVendor({
    super.key,
    required this.vendorItemModel,
  });
  final VendorItemModel vendorItemModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(16.r)),
        child: CachedNetworkImage(
          imageUrl: vendorItemModel.picUrl,
          height: 137.h,
          fit: BoxFit.cover,
          placeholder: (context, url) => const Center(
              child: CircularProgressIndicator(
            color: Colors.green,
          )),
          errorWidget: (context, url, error) =>
              const Center(child: Icon(Icons.error)),
        ),
      ),
    );
  }
}
