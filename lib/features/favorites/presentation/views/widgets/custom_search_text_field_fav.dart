import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grace_cycle/core/utils/app_colors.dart';
import 'package:grace_cycle/features/favorites/presentation/manager/cubit/get_fav_cubit.dart';

class CustomSearchTextFieldFav extends StatelessWidget {
  const CustomSearchTextFieldFav({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      key: BlocProvider.of<GetFavCubit>(context).formFavKey,
      child: TextFormField(
        cursorColor: AppColors.greenButt,
        controller: BlocProvider.of<GetFavCubit>(context).serachFavController,
        onChanged: (value) {
          if (value.trim().isNotEmpty) {
            BlocProvider.of<GetFavCubit>(context).getFavFood(
              search: value,
              isInitial: false,
            );
            // BlocProvider.of<DiscoverCubit>(context).getVendorDiscover(
            //   search: value,
            //   loadingFromPagination: false,
            // );
          } else {
            BlocProvider.of<GetFavCubit>(context).getFavFood(
              isInitial: false,
            );
            // BlocProvider.of<DiscoverCubit>(context).getVendorDiscover(
            //   loadingFromPagination: false,
            // );
          }
        },
        onFieldSubmitted: (value) {
          if (value.trim().isNotEmpty) {
            BlocProvider.of<GetFavCubit>(context).getFavFood(
              search: value,
              isInitial: false,
            );
            // BlocProvider.of<DiscoverCubit>(context).getVendorDiscover(
            //   search: value,
            //   loadingFromPagination: false,
            // );
          } else {
            BlocProvider.of<GetFavCubit>(context).getFavFood(
              isInitial: false,
            );
            // BlocProvider.of<DiscoverCubit>(context).getVendorDiscover(
            //   loadingFromPagination: false,
            // );
          }
        },
        decoration: InputDecoration(
          hintText: 'Find what you want',
          hintStyle: GoogleFonts.poppins(
            color: Colors.black.withValues(alpha: 0.5),
            fontSize: 16.sp,
          ),
          suffixIcon: Icon(
            Icons.search,
            size: 20.sp,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.r),
            borderSide: const BorderSide(color: Colors.black),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.r),
            borderSide: const BorderSide(color: Colors.black),
          ),
        ),
      ),
    );
  }
}
