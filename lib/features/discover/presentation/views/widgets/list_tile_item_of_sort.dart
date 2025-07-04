import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grace_cycle/core/utils/app_text_styles.dart';
import 'package:grace_cycle/features/discover/presentation/manager/discover_cubit/discover_cubit.dart';

class ListTileItemOfSort extends StatelessWidget {
  const ListTileItemOfSort({super.key, required this.title, this.onTap});

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

List<ListTileItemOfSort> getSortOptions(BuildContext context) {
  final cubit = BlocProvider.of<DiscoverCubit>(context);

  if (cubit.isFood) {
    return [
      ListTileItemOfSort(
          title: 'Food Rating',
          onTap: () => cubit.updateSort('Food Rating', 'rating')),
      ListTileItemOfSort(
          title: 'Discount Rate',
          onTap: () => cubit.updateSort('Discount Rate', 'discount')),
      ListTileItemOfSort(
          title: 'Most Popular',
          onTap: () => cubit.updateSort('Most Popular', 'most Popular')),
      ListTileItemOfSort(
          title: 'Price', onTap: () => cubit.updateSort('Price', 'price')),
    ];
  } else {
    return [
      ListTileItemOfSort(
          title: 'Vendor Rating',
          onTap: () => cubit.updateSort('Vendor Rating', 'rating')),
      ListTileItemOfSort(
          title: 'Most Popular',
          onTap: () => cubit.updateSort('Most Popular', 'most popular')),
     
    ];
  }
}
