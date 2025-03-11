import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grace_cycle/core/utils/app_spacing.dart';
import 'package:grace_cycle/core/widgets/custom_app_bar.dart';

class SeeAllViewBody extends StatelessWidget {
  const SeeAllViewBody({
    super.key,
    required this.isVendor,
  });
  final bool isVendor;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 30.h),
      child: CustomScrollView(slivers: [
        SliverToBoxAdapter(
          child: CustomAppBar(
            title: 'Main Dashes',
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        SliverToBoxAdapter(
          child: verticalSpace(3.h),
        ),
        isVendor
            ? SliverToBoxAdapter(
                child: Text('Vendor',
                    style: TextStyle(
                      fontSize: 20.sp,
                    )),
                // child: CustomListOfVendorVer(
                //     foodTitle: 'Main Dashes',
                //     foodAsset: AppAssets.findYourDish),
              )
            : SliverToBoxAdapter(
                child: Text('Food Category',
                    style: TextStyle(
                      fontSize: 20.sp,
                    )),
                //ListOfCategorizedFood()
              ),
      ]),
    );
  }
}
