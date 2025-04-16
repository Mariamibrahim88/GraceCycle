import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grace_cycle/core/utils/app_colors.dart';
import 'package:grace_cycle/core/utils/app_spacing.dart';
import 'package:grace_cycle/core/utils/app_text_styles.dart';
import 'package:grace_cycle/features/discover/presentation/manager/discover_cubit/discover_cubit.dart';
import 'package:grace_cycle/features/discover/presentation/views/widgets/custom_search_text_field.dart';
import 'package:grace_cycle/features/discover/presentation/views/widgets/discover_vendors_list.dart';
import 'package:grace_cycle/features/discover/presentation/views/widgets/filter_container.dart';
import 'package:grace_cycle/features/discover/presentation/views/widgets/filter_icon.dart';
import 'package:grace_cycle/features/discover/presentation/views/widgets/food_discover_list.dart';
import 'package:grace_cycle/features/discover/presentation/views/widgets/list_tile_item_of_sort.dart';
import 'package:grace_cycle/features/discover/presentation/views/widgets/sort_by_container.dart';
import 'package:grace_cycle/features/discover/presentation/views/widgets/sort_container.dart';

class DiscoverViewBody extends StatelessWidget {
  const DiscoverViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DiscoverCubit, DiscoverState>(
      builder: (context, state) {
        final discoverCubit = BlocProvider.of<DiscoverCubit>(context);
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
                            discoverCubit.changeIsFilterVisible();
                          },
                          child: const FilterIcon(),
                        ),
                      ],
                    ),
                    verticalSpace(10),
                    GestureDetector(
                      onTap: () {
                        discoverCubit.changeIsExpanded();
                      },
                      child: SortByContainer(
                        isExpanded: discoverCubit.isExpanded,
                        nameOfSort: discoverCubit.title ?? 'Choose Sort',
                      ),
                    ),
                    verticalSpace(20),
                    TabBar(
                      onTap: (index) {
                        discoverCubit.changeTap(index);
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
                    Expanded(
                      child: IndexedStack(
                        index: discoverCubit.isFood ? 0 : 1,
                        children: const [
                          FoodDiscoverList(),
                          DiscoverVendorsList(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              if (discoverCubit.isExpanded)
                SortContainer(
                  isFood: discoverCubit.isFood,
                  sortOptions: getSortOptions(
                    context,
                  ),
                ),
              if (discoverCubit.isFilterVisible)
                FilterContainer(
                  isFood: discoverCubit.isFood,
                ),
            ],
          ),
        );
      },
    );
  }
}
