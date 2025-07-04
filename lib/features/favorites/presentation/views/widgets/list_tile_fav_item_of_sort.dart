import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grace_cycle/core/utils/app_text_styles.dart';
import 'package:grace_cycle/features/favorites/presentation/manager/cubit/get_fav_cubit.dart';

class ListTileFavItemOfSort extends StatelessWidget {
  const ListTileFavItemOfSort({super.key, required this.title, this.onTap});

  final String title;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ListTile(
        title: Text(
          title,
          style: AppTextStyles.nunito500Size16GreenButt,
        ),
      ),
    );
  }
}

List<ListTileFavItemOfSort> getSortOptionsFav(BuildContext context) {
  final cubit = BlocProvider.of<GetFavCubit>(context);

  if (cubit.isFood) {
    return [
      ListTileFavItemOfSort(
          title: 'Food Rating',
          onTap: () => cubit.updateSort('Food Rating', 'rating')),
      ListTileFavItemOfSort(
          title: 'Discount Rate',
          onTap: () => cubit.updateSort('Discount Rate', 'discount')),
      ListTileFavItemOfSort(
          title: 'Most Popular',
          onTap: () => cubit.updateSort('Most Popular', 'most Popular')),
      ListTileFavItemOfSort(
          title: 'Price', onTap: () => cubit.updateSort('Price', 'price')),
    ];
  } else {
    return [
      ListTileFavItemOfSort(
          title: 'Vendor Rating',
          onTap: () => cubit.updateSort('Vendor Rating', 'rating')),
      ListTileFavItemOfSort(
          title: 'Most Popular',
          onTap: () => cubit.updateSort('Most Popular', 'most popular')),
     
    ];
  }
}
