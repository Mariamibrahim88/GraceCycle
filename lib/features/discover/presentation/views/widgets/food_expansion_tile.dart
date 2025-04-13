import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grace_cycle/core/utils/app_colors.dart';
import 'package:grace_cycle/core/utils/app_text_styles.dart';
import 'package:grace_cycle/core/widgets/custom_loading.dart';
import 'package:grace_cycle/features/discover/presentation/manager/discover_cubit/discover_cubit.dart';
import 'package:grace_cycle/features/discover/presentation/views/widgets/list_tile_item_of_filter.dart';

class FoodExpansionTile extends StatelessWidget {
  const FoodExpansionTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ExpansionTile(
            title: Text(
              'Food Categories',
              style: AppTextStyles.nunito700Size18Black,
            ),
            children: [
              BlocBuilder<DiscoverCubit, DiscoverState>(
                builder: (context, state) {
                  if (state is GetCategoriesLoading) {
                    return const Center(child: CustomLoading());
                  } else if (state is GetCategoriesSuccess) {
                    return ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: state.categoriesList.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              final cubit =
                                  BlocProvider.of<DiscoverCubit>(context);
                              cubit.selectedCategoryId =
                                  state.categoriesList[index].id;
                              cubit.getFoodDiscover(
                                isInitial: false,
                              );
                              cubit.changeIsFilterVisible();
                            },
                            child: ListTileItemOfFilter(
                              title: state.categoriesList[index].nameOfCategory,
                            ),
                          );
                        });
                  } else if (state is GetCategoriesFailure) {
                    return Center(
                      child: Text(
                        state.errorMessage,
                        style: AppTextStyles.nunito400Size16Black.copyWith(
                          color: AppColors.redForPrice,
                        ),
                      ),
                    );
                  } else {
                    return const SizedBox();
                  }
                },
              ),
            ],
          ),
          const PriceExpansionTile(),
        ],
      ),
    );
  }
}

class PriceExpansionTile extends StatelessWidget {
  const PriceExpansionTile({super.key});

  @override
  Widget build(BuildContext context) {
    final List<int> staticPrices = [20, 50, 100, 150, 200];

    return ExpansionTile(
      title: Text(
        'Price',
        style: AppTextStyles.nunito700Size18Black,
      ),
      children: staticPrices.map((price) {
        return GestureDetector(
          onTap: () {
            final cubit = BlocProvider.of<DiscoverCubit>(context);
            cubit.selectedMaxPrice = price;
            cubit.getFoodDiscover(isInitial: false);
            cubit.changeIsFilterVisible();
          },
          child: ListTileItemOfFilter(title: '<$price EGP'),
        );
      }).toList(),
    );
  }
}
