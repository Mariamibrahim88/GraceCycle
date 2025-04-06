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
                  child: SortByContainer(isExpanded: isExpanded),
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
            ),
          if (isFilterVisible) const FilterContainer(),
        ],
      ),
    );
  }
}
