import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grace_cycle/core/utils/app_colors.dart';
import 'package:grace_cycle/features/discover/presentation/views/widgets/list_tile_item_of_sort.dart';

class SortContainer extends StatelessWidget {
  const SortContainer({super.key, required this.isFood});
  final bool isFood;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 100.h,
      right: 120.w,
      left: 75.w,
      child: Container(
        width: 193.w,
        height: 136.h,
        decoration: BoxDecoration(
          color: AppColors.basicWhite,
          borderRadius: BorderRadius.circular(15.r),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 5,
              spreadRadius: 2,
            ),
          ],
        ),
        child: SingleChildScrollView(
          child: Column(
            children: isFood
                ? [
                    const ListTileItemOfSort(
                      title: 'Food Rating',
                    ),
                    const ListTileItemOfSort(title: 'Discount Rate'),
                    const ListTileItemOfSort(title: ('Most Popular')),
                    const ListTileItemOfSort(title: ('Distance')),
                    const ListTileItemOfSort(title: ('Price')),
                  ]
                : [
                    const ListTileItemOfSort(title: 'Vendor Rating'),
                    const ListTileItemOfSort(title: ('Most Popular')),
                    const ListTileItemOfSort(title: ('Distance')),
                  ],
          ),
        ),
      ),
    );
  }
}
