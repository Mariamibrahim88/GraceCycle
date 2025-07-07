import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grace_cycle/core/utils/app_colors.dart';
import 'package:grace_cycle/features/details/data/models/vendor_item_details_model.dart';
import 'package:grace_cycle/features/home/presentation/manager/Home_cubit/home_cubit.dart';
import 'package:grace_cycle/features/home/presentation/manager/Home_cubit/home_state.dart';

class FavVendorContainer extends StatelessWidget {
  const FavVendorContainer({super.key, required this.vendorItem});

  final VendorItemDetailsModel vendorItem;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) => current is HomeUpdateVendorFavorites,
      builder: (context, state) {
        final homeCubit = BlocProvider.of<HomeCubit>(context);
        final isFavorite = homeCubit.favouritesForVendors[vendorItem.userId] ??
            vendorItem.isFavourite;
        return Positioned(
          left: 30.w,
          top: 150.h,
          bottom: 1,
          child: GestureDetector(
            onTap: () {
              homeCubit.toggleVendorFavorite(vendorItem.userId);
            },
            child: Container(
              height: 35.h,
              width: 35.w,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.grayForSmallContainer,
              ),
              child: Icon(
                Icons.favorite,
                color: isFavorite ? AppColors.greenButt : AppColors.grey3,
                size: 28.sp,
              ),
            ),
          ),
        );
      },
    );
  }
}
