import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grace_cycle/core/utils/app_colors.dart';
import 'package:grace_cycle/core/utils/app_text_styles.dart';
import 'package:grace_cycle/features/discover/presentation/views/widgets/discover_view_body.dart';
import 'package:grace_cycle/features/discover/presentation/views/widgets/list_tile_item_of_filter.dart';

class FilterContainer extends StatelessWidget {
  const FilterContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 70.h,
      right: 5.w,
      child: Container(
        width: 190.w,
        height: 500.h,
        padding: EdgeInsets.all(10.w),
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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ExpansionTile(
                title: Text(
                  'Food Category',
                  style: AppTextStyles.nunito700Size18Black,
                ),
                children: const [
                  ListTileItemOfFilter(title: 'Main dishes'),
                  ListTileItemOfFilter(title: 'Healthy'),
                  ListTileItemOfFilter(title: ('Dessert')),
                  ListTileItemOfFilter(title: ('Baked Goods')),
                  ListTileItemOfFilter(title: ('Drinks')),
                ],
              ),
              ExpansionTile(
                title: Text(
                  'Distance',
                  style: AppTextStyles.nunito700Size18Black,
                ),
                children: const [
                  ListTileItemOfFilter(title: ('< 5 km')),
                  ListTileItemOfFilter(title: '< 10 km'),
                  ListTileItemOfFilter(title: ('< 15 km')),
                  ListTileItemOfFilter(title: ('< 20 km')),
                ],
              ),
              ExpansionTile(
                title: Text(
                  'Price',
                  style: AppTextStyles.nunito700Size18Black,
                ),
                children: const [
                  ListTileItemOfFilter(title: ('< 50')),
                  ListTileItemOfFilter(title: ('< 250')),
                  ListTileItemOfFilter(title: ('< 350')),
                  ListTileItemOfFilter(title: ('< 550')),
                ],
              ),
              ExpansionTile(
                showTrailingIcon: false,
                title: Text(
                  'From Favourites',
                  style: AppTextStyles.nunito700Size18Black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
