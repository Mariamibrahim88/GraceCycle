import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grace_cycle/core/utils/app_colors.dart';
import 'package:grace_cycle/core/utils/app_spacing.dart';
import 'package:grace_cycle/core/utils/app_text_styles.dart';
import 'package:grace_cycle/features/discover/presentation/views/widgets/custom_search_text_field.dart';
import 'package:grace_cycle/features/discover/presentation/views/widgets/discover_vendors_list.dart';
import 'package:grace_cycle/features/discover/presentation/views/widgets/filter_container.dart';
import 'package:grace_cycle/features/discover/presentation/views/widgets/filter_icon.dart';
import 'package:grace_cycle/features/discover/presentation/views/widgets/food_discover_list.dart';
import 'package:grace_cycle/features/discover/presentation/views/widgets/list_tile_item_of_sort.dart';
import 'package:grace_cycle/features/discover/presentation/views/widgets/sort_by_container.dart';
import 'package:grace_cycle/features/discover/presentation/views/widgets/sort_container.dart';

class DiscoverViewBody extends StatefulWidget {
  const DiscoverViewBody({super.key});

  @override
  _DiscoverViewBodyState createState() => _DiscoverViewBodyState();
}

class _DiscoverViewBodyState extends State<DiscoverViewBody> {
  bool isFilterVisible = false;
  bool isExpanded = false;
  bool isFood = true;
  String? nameOfSort;
  String? title;

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
                      child: CustomSearchTextField(),
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
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isExpanded = !isExpanded;
                    });
                  },
                  child: SortByContainer(
                    isExpanded: isExpanded,
                    nameOfSort:
                        title ?? (isFood ? 'Food Rating' : 'Vendor Rating'),
                  ),
                ),
                verticalSpace(20),
                TabBar(
                  onTap: (index) {
                    setState(() {
                      isFood = index == 0;
                    });
                  },
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
                      FoodDiscoverList(),
                      DiscoverVendorsList(),
                    ],
                  ),
                ),
              ],
            ),
          ),
          if (isExpanded)
            SortContainer(
                isFood: isFood,
                sortOptions: isFood
                    ? [
                        ListTileItemOfSort(
                            title: 'Food Rating',
                            onTap: () {
                              setState(() {
                                title = 'Food Rating';
                                nameOfSort = 'rating';
                              });
                            }),
                        ListTileItemOfSort(
                            title: 'Discount Rate',
                            onTap: () {
                              setState(() {
                                title = 'Discount Rate';
                                nameOfSort = 'discount rate';
                              });
                            }),
                        ListTileItemOfSort(
                            title: 'Most Popular',
                            onTap: () {
                              setState(() {
                                nameOfSort = 'most Popular';
                                title = 'Most Popular';
                              });
                            }),
                        ListTileItemOfSort(
                            title: 'Price',
                            onTap: () {
                              setState(() {
                                nameOfSort = 'price';
                                title = 'Price';
                              });
                            }),
                      ]
                    : [
                        ListTileItemOfSort(
                            title: 'Vendor Rating',
                            onTap: () {
                              setState(() {
                                title = 'Vendor Rating';
                                nameOfSort = 'rating';
                              });
                            }),
                        ListTileItemOfSort(
                            title: 'Most Popular',
                            onTap: () {
                              setState(() {
                                nameOfSort = 'most popular';
                                title = 'Most Popular';
                              });
                            }),
                        ListTileItemOfSort(
                            title: 'Distance',
                            onTap: () {
                              setState(() {
                                title = 'Distance';
                                nameOfSort = 'distance';
                              });
                            }),
                      ]),
          if (isFilterVisible) const FilterContainer(),
        ],
      ),
    );
  }
}
