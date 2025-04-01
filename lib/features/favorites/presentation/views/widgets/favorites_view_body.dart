import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grace_cycle/core/utils/app_colors.dart';
import 'package:grace_cycle/core/utils/app_spacing.dart';
import 'package:grace_cycle/core/utils/app_text_styles.dart';
import 'package:grace_cycle/features/discover/presentation/views/widgets/custom_search_text_field.dart';
import 'package:grace_cycle/features/discover/presentation/views/widgets/filter_container.dart';
import 'package:grace_cycle/features/discover/presentation/views/widgets/filter_icon.dart';
import 'package:grace_cycle/features/discover/presentation/views/widgets/sort_container.dart';
import 'package:grace_cycle/features/favorites/presentation/views/widgets/favorite_food_card.dart';
import 'package:grace_cycle/features/favorites/presentation/views/widgets/favorite_vendor_card.dart';

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
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 15.h),
          child: SingleChildScrollView(
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
                  child: Row(
                    children: [
                      Text('Sort by:',
                          style: isExpanded
                              ? AppTextStyles.nunito500Size16GreenButt
                              : AppTextStyles.nunito400Size16Black),
                      Icon(
                        isExpanded
                            ? Icons.keyboard_arrow_up
                            : Icons.keyboard_arrow_down,
                        color: isExpanded ? AppColors.greenButt : Colors.black,
                      ),
                    ],
                  ),
                ),
                verticalSpace(20),
                DefaultTabController(
                  length: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TabBar(
                        labelStyle: AppTextStyles.nunito700Size16GreenButt,
                        unselectedLabelStyle:
                            AppTextStyles.nunito700Size16Black,
                        indicatorColor: AppColors.greenButt,
                        indicatorSize: TabBarIndicatorSize.tab,
                        tabs: const [
                          Tab(text: 'Food'),
                          Tab(text: 'Vendor'),
                        ],
                      ),
                      verticalSpace(20),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.8,
                        child: TabBarView(
                          children: [
                            ListView.builder(
                              itemCount: 10,
                              itemBuilder: (context, index) => const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: FavoriteFoodCard(),
                              ),
                            ),
                            ListView.builder(
                              itemCount: 10,
                              itemBuilder: (context, index) =>
                                  const FavoriteVendorCard(),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        if (isExpanded) const SortContainer(),
        if (isFilterVisible) const FilterContainer(),
      ],
    );
  }
}
