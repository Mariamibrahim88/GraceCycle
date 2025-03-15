import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grace_cycle/core/utils/app_spacing.dart';
import 'package:grace_cycle/features/home/data/models/vendors_model.dart';

class VendorInfo extends StatelessWidget {
  const VendorInfo({
    super.key,
    required this.vendorItemModel,
  });
  final VendorItemModel vendorItemModel;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.isFinite ? 0.7.sw : 0.7.sw,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              vendorItemModel.userName,
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
            CircleAvatar(
              radius: 20.r,
              backgroundColor: Colors.white,
              child: CachedNetworkImage(
                imageUrl: vendorItemModel.logoUrl,
                height: 137.h,
                fit: BoxFit.cover,
                placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(
                  color: Colors.green,
                )),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          ]),
          Text(
            vendorItemModel.address,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
          ),
          verticalSpace(5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'from ${vendorItemModel.opening} to ${vendorItemModel.closing}',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.black54,
                ),
              ),
              Text(
                '5.7 km',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
