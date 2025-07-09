import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grace_cycle/core/utils/app_colors.dart';
import 'package:grace_cycle/core/utils/app_text_styles.dart';
import 'package:grace_cycle/features/favorites/presentation/manager/cubit/get_fav_cubit.dart';

class ListTileFavItemOfSort extends StatelessWidget {
  const ListTileFavItemOfSort(
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

List<ListTileFavItemOfSort> getSortOptionsFav(BuildContext context) {
  final cubit = BlocProvider.of<GetFavCubit>(context);
  final selectedSort = cubit.selectedSort;

  if (cubit.isFood) {
    return [
      ListTileFavItemOfSort(
        title: 'Food Rating',
        isSelected: selectedSort == 'rating',
        onTap: () => cubit.updateSort('Food Rating', 'rating'),
      ),
      ListTileFavItemOfSort(
        title: 'Discount Rate',
        isSelected: selectedSort == 'discount',
        onTap: () => cubit.updateSort('Discount Rate', 'discount'),
      ),
      ListTileFavItemOfSort(
        title: 'Most Popular',
        isSelected: selectedSort == 'most Popular',
        onTap: () => cubit.updateSort('Most Popular', 'most Popular'),
      ),
      ListTileFavItemOfSort(
        title: 'Price',
        isSelected: selectedSort == 'price',
        onTap: () => cubit.updateSort('Price', 'price'),
      ),
    ];
  } else {
    return [
      ListTileFavItemOfSort(
        title: 'Vendor Rating',
        isSelected: selectedSort == 'rating',
        onTap: () => cubit.updateSort('Vendor Rating', 'rating'),
      ),
      ListTileFavItemOfSort(
        title: 'Most Popular',
        isSelected: selectedSort == 'most popular',
        onTap: () => cubit.updateSort('Most Popular', 'most popular'),
      ),
      // ListTileFavItemOfSort(
      //   title: 'Distance',
      //   isSelected: selectedSort == 'distance',
      //   onTap: () => cubit.updateSort('Distance', 'distance'),
      // ),
    ];
  }
}
