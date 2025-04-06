import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grace_cycle/core/service/service_locator.dart';
import 'package:grace_cycle/core/utils/app_colors.dart';
import 'package:grace_cycle/core/utils/app_spacing.dart';
import 'package:grace_cycle/core/utils/app_text_styles.dart';
import 'package:grace_cycle/core/widgets/custom_list_of_shimmer_ver.dart';
import 'package:grace_cycle/core/widgets/custom_loading.dart';
import 'package:grace_cycle/features/discover/presentation/manager/discover_cubit/discover_cubit.dart';
import 'package:grace_cycle/features/discover/presentation/views/widgets/custom_list_of_shimmer_ver.dart';
import 'package:grace_cycle/features/discover/presentation/views/widgets/custom_search_text_field.dart';
import 'package:grace_cycle/features/discover/presentation/views/widgets/filter_container.dart';
import 'package:grace_cycle/features/discover/presentation/views/widgets/filter_icon.dart';
import 'package:grace_cycle/features/discover/presentation/views/widgets/food_discover_list.dart';
import 'package:grace_cycle/features/discover/presentation/views/widgets/sort_by_container.dart';
import 'package:grace_cycle/features/discover/presentation/views/widgets/sort_container.dart';
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
          if (isExpanded) const SortContainer(),
          if (isFilterVisible) const FilterContainer(),
        ],
      ),
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
        buildWhen: (previous, current) {
          return current is! DiscoverVendorLoading;
        },
        builder: (context, state) {
          if (state is DiscoverVendorLoading) {
            return const CustomListOfShimmerFavVer();
          } else if (state is DiscoverVendorFailure) {
            return Center(
              child: Text(
                state.errorMessage,
                style: AppTextStyles.nunito700Size16Black,
              ),
            );
          } else if (state is DiscoverVendorSuccess) {
            return NotificationListener<ScrollNotification>(
              onNotification: (ScrollNotification scrollInfo) {
                if (scrollInfo.metrics.pixels ==
                        scrollInfo.metrics.maxScrollExtent &&
                    scrollInfo is ScrollUpdateNotification) {
                  BlocProvider.of<DiscoverCubit>(context).getVendorDiscover(
                    loadingFromPagination: true,
                  );
                }
                return true;
              },
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: BlocProvider.of<DiscoverCubit>(context)
                          .vendorList
                          .length,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.only(
                          left: 20.0,
                          right: 10.0,
                          bottom: 8,
                          top: 8,
                        ),
                        child: VendorCard(
                          vendorItemModel:
                              BlocProvider.of<DiscoverCubit>(context)
                                  .vendorList[index],
                        ),
                      ),
                    ),
                  ),
                  // state is DiscoverVendorPaginationLoading
                  //     ? const CustomLoading()
                  //     : const SizedBox.shrink(),
                ],
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
