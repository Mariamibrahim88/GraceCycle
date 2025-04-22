import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grace_cycle/core/utils/app_colors.dart';
import 'package:grace_cycle/core/utils/app_spacing.dart';
import 'package:grace_cycle/core/utils/app_text_styles.dart';
import 'package:grace_cycle/features/discover/presentation/views/widgets/filter_icon.dart';
import 'package:grace_cycle/features/discover/presentation/views/widgets/sort_container.dart';
import 'package:grace_cycle/features/favorites/presentation/manager/cubit/get_fav_cubit.dart';
import 'package:grace_cycle/features/favorites/presentation/views/widgets/custom_search_text_field_fav.dart';
import 'package:grace_cycle/features/favorites/presentation/views/widgets/fav_food_list.dart';
import 'package:grace_cycle/features/favorites/presentation/views/widgets/fav_vendor_list.dart';
import 'package:grace_cycle/features/favorites/presentation/views/widgets/filter_fav_container.dart';
import 'package:grace_cycle/features/favorites/presentation/views/widgets/list_tile_fav_item_of_sort.dart';
import 'package:grace_cycle/features/favorites/presentation/views/widgets/sort_by_container_fav.dart';

class FavoritesViewBody extends StatelessWidget {
  const FavoritesViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetFavCubit, GetFavState>(
      builder: (context, state) {
        final favCubit = BlocProvider.of<GetFavCubit>(context);
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
                            favCubit.changeIsFilterVisible(context);
                          },
                          child: const FilterIcon(),
                        ),
                      ],
                    ),
                    verticalSpace(10),
                    GestureDetector(
                      onTap: () {
                        favCubit.changeIsExpanded();
                      },
                      child: SortByContainerFav(
                        isExpanded: favCubit.isExpanded,
                        nameOfSort: favCubit.title ?? 'Choose Sort',
                      ),
                    ),
                    TabBar(
                      onTap: (index) {
                        favCubit.changeTap(index);
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
                        index: favCubit.isFood ? 0 : 1,
                        children: const [
                          FavFoodList(),
                          FavVendorsList(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              if (favCubit.isExpanded)
                SortContainer(
                  isFood: favCubit.isFood,
                  sortOptions: getSortOptionsFav(
                    context,
                  ),
                ),
              if (favCubit.isFilterVisible)
                FilterFavContainer(
                  isFood: favCubit.isFood,
                ),
            ],
          ),
        );
      },
    );
  }
}
