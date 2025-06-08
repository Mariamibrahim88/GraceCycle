import 'package:flutter/material.dart'
    show
        Alignment,
        BuildContext,
        Navigator,
        Positioned,
        Stack,
        StatelessWidget,
        Widget;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grace_cycle/core/widgets/custom_app_bar.dart';
import 'package:grace_cycle/features/details/presentation/views/widgets/container_of_image.dart';
import 'package:grace_cycle/features/details/presentation/views/widgets/fav_container.dart';
import 'package:grace_cycle/features/home/presentation/views/widgets/custom_vendor_logo.dart';

class VendorDetailsCard extends StatelessWidget {
  const VendorDetailsCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        //const ContainerOfImage(),
        Positioned(
          top: 28.h,
          left: 10.w,
          child: CustomAppBar(
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        //const FavContainer(),
        Positioned(
          bottom: 40.h,
          right: 50.w,
          child: CustomVendorLogo(
            width: 40.w,
            height: 35.h,
            logoUrl:
                'https://img.freepik.com/premium-vector/restaurant-logo-design_1298798-2767.jpg?w=826',
          ),
        ),
      ],
    );
  }
}
