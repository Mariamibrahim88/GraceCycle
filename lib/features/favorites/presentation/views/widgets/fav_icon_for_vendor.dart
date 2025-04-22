import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grace_cycle/core/utils/app_colors.dart';
import 'package:grace_cycle/features/favorites/data/models/fav_vendor_model.dart';
import 'package:grace_cycle/features/favorites/presentation/manager/cubit/get_fav_cubit.dart';

class FavIconForVendor extends StatelessWidget {
  const FavIconForVendor({super.key, required this.favVendorItem});
  final FavVendorItem favVendorItem;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        BlocProvider.of<GetFavCubit>(context)
            .removeFromFavoriteVendor(favVendorItem.userId);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Icon(
          Icons.favorite,
          color: AppColors.greenButt,
          size: 28.sp,
        ),
      ),
    );
  }
}
