import 'package:flutter/material.dart';
import 'package:grace_cycle/core/utils/app_assets.dart';
import 'package:grace_cycle/core/widgets/custom_app_bar.dart';
import 'package:grace_cycle/features/home/presentation/views/widgets/custom_home_app_bar.dart';
import 'package:grace_cycle/features/home/presentation/views/widgets/custom_list_of_food_ver.dart';
import 'package:grace_cycle/features/home/presentation/views/widgets/custom_list_of_vendor_ver.dart';

class SeeAllViewBody extends StatelessWidget {
  const SeeAllViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: [
      const CustomHomeAppBar(),
      SliverToBoxAdapter(
        child: CustomAppBar(
          title: 'Main Dashes',
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      SliverToBoxAdapter(
        child: CustomListOfVendorVer(
            foodTitle: 'Main Dashes', foodAsset: AppAssets.findYourDish),
      ),
      SliverToBoxAdapter(
          // child: CustomListOfFoodVer(
          //     foodTitle: 'Main Dashes', foodAsset: AppAssets.findYourDish),
          ),
    ]);
  }
}
