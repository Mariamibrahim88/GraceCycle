import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grace_cycle/core/utils/app_colors.dart';
import 'package:grace_cycle/features/discover/presentation/views/widgets/list_tile_item_of_sort.dart';

class SortContainer extends StatelessWidget {
  const SortContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 100.h,
      left: 10.w,
      child: Container(
        width: 193.w,
        height: 136.h,
        decoration: BoxDecoration(
          color: AppColors.basicWhite,
          borderRadius: BorderRadius.circular(15.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 5,
              spreadRadius: 2,
            ),
          ],
        ),
        child: const SingleChildScrollView(
          child: Column(
            children: [
              ListTileItemOfSort(title: 'Food Rating'),
              ListTileItemOfSort(title: 'Discount Rate'),
              ListTileItemOfSort(title: ('Most Popular')),
              ListTileItemOfSort(title: ('Distance')),
              ListTileItemOfSort(title: ('Price')),
            ],
          ),
        ),
      ),
    );
  }
}
