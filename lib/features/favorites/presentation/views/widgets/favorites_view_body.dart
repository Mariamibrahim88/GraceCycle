import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grace_cycle/core/utils/app_colors.dart';
import 'package:grace_cycle/core/utils/app_spacing.dart';
import 'package:grace_cycle/core/utils/app_text_styles.dart';
import 'package:grace_cycle/features/discover/presentation/views/widgets/filter_container.dart';
import 'package:grace_cycle/features/discover/presentation/views/widgets/filter_icon.dart';
import 'package:grace_cycle/features/favorites/presentation/views/widgets/custom_search_for_fav.dart';
import 'package:grace_cycle/features/favorites/presentation/views/widgets/fav_food_list.dart';
import 'package:grace_cycle/features/favorites/presentation/views/widgets/fav_vendors_list.dart';

class FavoritesViewBody extends StatefulWidget {
  const FavoritesViewBody({super.key});

  @override
  State<FavoritesViewBody> createState() => _FavoritesViewBodyState();
}

class _FavoritesViewBodyState extends State<FavoritesViewBody> {
  bool isFilterVisible = false;
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 15.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Expanded(
                      child: CustomSearchTextFieldFav(),
                    ),
                    horizontalSpace(10),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isFilterVisible = !isFilterVisible;
                        });
                      },
                      child: const FilterIcon(),
                    ),
                  ],
                ),
                verticalSpace(10),
                // GestureDetector(
                //   onTap: () {
                //     setState(() {
                //       isExpanded = !isExpanded;
                //     });
                //   },
                //   child: SortByContainer(
                //     isExpanded: isExpanded,
                //     nameOfSort: 'Food Rating',
                //   ),
                // ),
                // verticalSpace(20),
                TabBar(
                  labelStyle: AppTextStyles.nunito700Size16GreenButt,
                  unselectedLabelStyle: AppTextStyles.nunito700Size16Black,
                  indicatorColor: AppColors.greenButt,
                  indicatorSize: TabBarIndicatorSize.tab,
                  tabs: const [
                    Tab(text: 'Food'),
                    Tab(text: 'Vendor'),
                  ],
                ),
                verticalSpace(20),
                const Expanded(
                  child: TabBarView(
                    children: [
                      FavFoodList(),
                      FavVendorsList(),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // if (isExpanded)
          //   SortContainer(
          //     isFood: true,
          //     sortOptions: [
          //       ListTileItemOfSort(
          //         title: 'Food Rating',
          //         onTap: () {
          //           setState(() {
          //             isExpanded = false;
          //           });
          //         },
          //       ),
          //       ListTileItemOfSort(
          //         title: 'Vendor Rating',
          //         onTap: () {
          //           setState(() {
          //             isExpanded = false;
          //           });
          //         },
          //       ),
          //     ],
          //   ),
          //if (isFilterVisible) const FilterContainer(),
        ],
      ),
    );
  }
}
