import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grace_cycle/core/service/service_locator.dart';
import 'package:grace_cycle/core/utils/app_colors.dart';
import 'package:grace_cycle/core/utils/app_spacing.dart';
import 'package:grace_cycle/core/utils/app_text_styles.dart';
import 'package:grace_cycle/core/widgets/custom_list_of_shimmer_ver.dart';
import 'package:grace_cycle/features/discover/presentation/views/widgets/custom_search_text_field.dart';
import 'package:grace_cycle/features/discover/presentation/views/widgets/filter_container.dart';
import 'package:grace_cycle/features/discover/presentation/views/widgets/filter_icon.dart';
import 'package:grace_cycle/features/discover/presentation/views/widgets/sort_by_container.dart';
import 'package:grace_cycle/features/discover/presentation/views/widgets/sort_container.dart';
import 'package:grace_cycle/features/favorites/presentation/manager/cubit/get_fav_cubit.dart';
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
                  child: TabBarView(
                    children: [
                      BlocBuilder<GetFavCubit, GetFavState>(
                        builder: (context, state) {
                          if (state is GetFavLoading) {
                            return const CustomListOfShimmerFavVer();
                          } else if (state is GetFavSuccess) {
                            return ListView.builder(
                              itemCount: state.favfoodModel.length,
                              itemBuilder: (context, index) => Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0, vertical: 12),
                                child: FavoriteFoodCard(
                                  favFoodModel: state.favfoodModel[index],
                                ),
                              ),
                            );
                          }
                          return const SizedBox();
                        },
                      ),
                      BlocProvider(
                        create: (context) => GetFavCubit(sl())..getFavVendors(),
                        child: BlocBuilder<GetFavCubit, GetFavState>(
                          builder: (context, state) {
                            if (state is GetFavVendorsLoading) {
                              return const CustomListOfShimmerFavVer();
                            } else if (state is GetFavVendorsSuccess) {
                              return ListView.builder(
                                itemCount: state.favVendorModel.length,
                                itemBuilder: (context, index) => Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0, vertical: 12),
                                  child: FavoriteVendorCard(
                                    favVendorModel: state.favVendorModel[index],
                                  ),
                                ),
                              );
                            }
                            return const SizedBox();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          if (isExpanded) const SortContainer(),
          if (isFilterVisible) const FilterContainer(),
        ],
      ),
    );
  }
}
