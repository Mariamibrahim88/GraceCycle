import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grace_cycle/core/utils/app_colors.dart';
import 'package:grace_cycle/core/utils/app_text_styles.dart';
import 'package:grace_cycle/features/discover/presentation/manager/discover_cubit/discover_cubit.dart';

class ListTileItemOfSort extends StatelessWidget {
  const ListTileItemOfSort(
      {super.key, required this.title, this.onTap, this.isSelected = false});

  final String title;
  final void Function()? onTap;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ListTile(
        title: Text(
          title,
          style: isSelected
              ? AppTextStyles.nunito500Size16GreenButt
                  .copyWith(color: AppColors.greenButt)
              : AppTextStyles.nunito500Size16GreenButt
                  .copyWith(color: Colors.black),
        ),
      ),
    );
  }
}

List<ListTileItemOfSort> getSortOptions(BuildContext context) {
  final cubit = BlocProvider.of<DiscoverCubit>(context);
  final selectedSort = cubit.selectedSort;

  if (cubit.isFood) {
    return [
      ListTileItemOfSort(
        title: 'Food Rating',
        isSelected: selectedSort == 'rating',
        onTap: () => cubit.updateSort('Food Rating', 'rating'),
      ),
      ListTileItemOfSort(
        title: 'Discount Rate',
        isSelected: selectedSort == 'discount',
        onTap: () => cubit.updateSort('Discount Rate', 'discount'),
      ),
      ListTileItemOfSort(
        title: 'Most Popular',
        isSelected: selectedSort == 'most Popular',
        onTap: () => cubit.updateSort('Most Popular', 'most Popular'),
      ),
      ListTileItemOfSort(
        title: 'Price',
        isSelected: selectedSort == 'price',
        onTap: () => cubit.updateSort('Price', 'price'),
      ),
    ];
  } else {
    return [
      ListTileItemOfSort(
        title: 'Vendor Rating',
        isSelected: selectedSort == 'rating',
        onTap: () => cubit.updateSort('Vendor Rating', 'rating'),
      ),
      ListTileItemOfSort(
        title: 'Most Popular',
        isSelected: selectedSort == 'most popular',
        onTap: () => cubit.updateSort('Most Popular', 'most popular'),
      ),
      ListTileItemOfSort(
        title: 'Distance',
        isSelected: selectedSort == 'distance',
        onTap: () => cubit.updateSort('Distance', 'distance'),
      ),
    ];
  }
}
