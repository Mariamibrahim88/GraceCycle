import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grace_cycle/core/service/service_locator.dart';
import 'package:grace_cycle/core/utils/app_colors.dart';
import 'package:grace_cycle/core/utils/app_spacing.dart';
import 'package:grace_cycle/core/utils/app_text_styles.dart';
import 'package:grace_cycle/core/widgets/custom_list_of_shimmer_ver.dart';
import 'package:grace_cycle/features/discover/presentation/manager/discover_cubit/discover_cubit.dart';
import 'package:grace_cycle/features/discover/presentation/views/widgets/custom_list_of_shimmer_ver.dart';
import 'package:grace_cycle/features/discover/presentation/views/widgets/custom_search_text_field.dart';
import 'package:grace_cycle/features/discover/presentation/views/widgets/filter_container.dart';
import 'package:grace_cycle/features/discover/presentation/views/widgets/filter_icon.dart';
import 'package:grace_cycle/features/discover/presentation/views/widgets/sort_by_container.dart';
import 'package:grace_cycle/features/discover/presentation/views/widgets/sort_container.dart';
import 'package:grace_cycle/features/home/presentation/views/widgets/food_card.dart';
import 'package:grace_cycle/features/home/presentation/views/widgets/vendor_card.dart';

class DiscoverViewBody extends StatefulWidget {
  const DiscoverViewBody({super.key});

  @override
  _DiscoverViewBodyState createState() => _DiscoverViewBodyState();
}

class _DiscoverViewBodyState extends State<DiscoverViewBody> {
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
                  child: SortByContainer(isExpanded: isExpanded),
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
                            BlocBuilder<DiscoverCubit, DiscoverState>(
                              builder: (context, state) {
                                if (state is DiscoverFoodLoading) {
                                  return const CustomListOfShimmerFavVer();
                                } else if (state is DiscoverFoodSuccess) {
                                  return NotificationListener<
                                      ScrollNotification>(
                                    onNotification: (notification) {
                                      if (notification.metrics.pixels ==
                                          notification
                                              .metrics.maxScrollExtent) {
                                        // context
                                        //     .read<DiscoverCubit>()
                                        //     .getMoreFoodItems();
                                        print(
                                            'Reached the end of the list, load more items');
                                      }
                                      return true;
                                    },
                                    child: ListView.builder(
                                      itemCount:
                                          state.discoverFoodModel.data.length,
                                      itemBuilder: (context, index) => Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8.0, vertical: 12),
                                        child: FoodCard(
                                          foodItemModel: state
                                              .discoverFoodModel.data[index],
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                return const SizedBox();
                              },
                            ),
                            const DiscoverVendorsList(),
                            // ListView.builder(
                            //   itemCount: 10,
                            //   itemBuilder: (context, index) =>
                            //       const FooddCard(),
                            // ),
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

class DiscoverVendorsList extends StatelessWidget {
  const DiscoverVendorsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DiscoverCubit(sl())..getVendorDiscover(),
      child: BlocBuilder<DiscoverCubit, DiscoverState>(
        builder: (context, state) {
          if (state is DiscoverVendorLoading) {
            return const CustomListOfShimmerVer();
          } else if (state is DiscoverVendorSuccess) {
            return ListView.builder(
              itemCount: state.vendorsModel.data.length,
              itemBuilder: (context, index) => VendorCard(
                vendorItemModel: state.vendorsModel.data[index],
              ),
            );
          }
          return Center(
            child: Text(
              'No Vendors Found',
              style: AppTextStyles.nunito700Size16Black,
            ),
          );
        },
      ),
    );
  }
}
