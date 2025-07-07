import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grace_cycle/core/widgets/custom_app_bar.dart';
import 'package:grace_cycle/features/details/data/models/vendor_item_details_model.dart';
import 'package:grace_cycle/features/details/presentation/views/widgets/Fav_vendor_container.dart';
import 'package:grace_cycle/features/details/presentation/views/widgets/container_of_image.dart';
import 'package:grace_cycle/features/home/presentation/views/widgets/custom_vendor_logo.dart';

class VendorDetailsCard extends StatelessWidget {
  const VendorDetailsCard({
    super.key,
    required this.vendorItemModel,
  });
  final VendorItemDetailsModel vendorItemModel;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        ContainerOfImage(
          imageOfFood: vendorItemModel.picUrl,
        ),
        Positioned(
          top: 15.h,
          left: 10.w,
          child: CustomAppBar(
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        FavVendorContainer(
          vendorItem: vendorItemModel,
        ),
        Positioned(
          bottom: 40.h,
          right: 50.w,
          child: CustomVendorLogo(
            width: 40.w,
            height: 35.h,
            logoUrl: vendorItemModel.logoUrl,
          ),
        ),
      ],
    );
  }
}
