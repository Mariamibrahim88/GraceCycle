import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grace_cycle/core/utils/app_assets.dart';
import 'package:grace_cycle/core/utils/app_spacing.dart';
import 'package:grace_cycle/features/home/presentation/views/widgets/custom_home_app_bar.dart';
import 'package:grace_cycle/features/home/presentation/views/widgets/custom_list_of_food_hor.dart';
import 'package:grace_cycle/features/home/presentation/views/widgets/header_of_category.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      child: CustomScrollView(
        slivers: [
          const CustomHomeAppBar(),
          SliverToBoxAdapter(child: verticalSpace(10)),
          const SliverToBoxAdapter(
              child: HeadOfCategory(title: 'Recommend to you')),

          SliverToBoxAdapter(
            child: CustomListOfFoodHor(
              foodTitle: 'Grilled Chicken',
              foodAsset: AppAssets.recommendedFood,
            ),
          ),

          SliverToBoxAdapter(child: verticalSpace(10)),
          const SliverToBoxAdapter(
              child: HeadOfCategory(title: 'Find your Dish')),

          SliverToBoxAdapter(
            child: CustomListOfFoodHor(
              foodTitle: 'Mushroom Soup',
              foodAsset: AppAssets.findYourDish,
            ),
          ),

          SliverToBoxAdapter(child: verticalSpace(10)),
          const SliverToBoxAdapter(child: HeadOfCategory(title: 'Healthy')),

          SliverToBoxAdapter(
            child: CustomListOfFoodHor(
              foodTitle: 'Greek Salad',
              foodAsset: AppAssets.healthy,
            ),
          ),
          SliverToBoxAdapter(child: verticalSpace(10)),
          const SliverToBoxAdapter(child: HeadOfCategory(title: 'Baked Goods')),

          SliverToBoxAdapter(
            child: CustomListOfFoodHor(
              foodTitle: 'Sourdough Bread',
              foodAsset: AppAssets.baked,
            ),
          ),
          SliverToBoxAdapter(child: verticalSpace(10)),
          const SliverToBoxAdapter(child: HeadOfCategory(title: 'Dessert')),

          SliverToBoxAdapter(
            child: CustomListOfFoodHor(
              foodTitle: 'Oatmeal Cookies',
              foodAsset: AppAssets.dessert,
            ),
          ),
          SliverToBoxAdapter(child: verticalSpace(10)),
          const SliverToBoxAdapter(child: HeadOfCategory(title: 'Drinks')),

          SliverToBoxAdapter(
            child: CustomListOfFoodHor(
              foodTitle: 'Coffee Latte',
              foodAsset: AppAssets.drink,
            ),
          ),

          // SliverList.builder(
          //   itemCount: 5,
          //   itemBuilder: (context, index) => Padding(
          //     padding: EdgeInsets.symmetric(vertical: 8.h),
          //     child: Column(
          //       children: [
          //         const HeadOfCategory(title: 'Recommend to you'),
          //         verticalSpace(10),
          //         const CustomListOfFoodHor(),
          //       ],
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
