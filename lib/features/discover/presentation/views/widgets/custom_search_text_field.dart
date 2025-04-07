import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grace_cycle/core/utils/app_colors.dart';
import 'package:grace_cycle/features/discover/presentation/manager/discover_cubit/discover_cubit.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      key: BlocProvider.of<DiscoverCubit>(context).formKey,
      child: TextFormField(
        cursorColor: AppColors.greenButt,
        controller: BlocProvider.of<DiscoverCubit>(context).serachController,
        onChanged: (value) {
          if (value.trim().isNotEmpty) {
            BlocProvider.of<DiscoverCubit>(context).getFoodDiscover(
              search: value,
              isInitial: true,
            );
            BlocProvider.of<DiscoverCubit>(context).getVendorDiscover(
              search: value,
              loadingFromPagination: true,
            );
          }
        },
        onFieldSubmitted: (value) {
          if (value.trim().isNotEmpty) {
            BlocProvider.of<DiscoverCubit>(context).getFoodDiscover(
              search: value,
              isInitial: true,
            );
            BlocProvider.of<DiscoverCubit>(context).getVendorDiscover(
              search: value,
              loadingFromPagination: true,
            );
          }
        },
        // onChanged: (value) {
        //   BlocProvider.of<DiscoverCubit>(context).getFoodDiscover(
        //     search: value,
        //     isInitial: true,
        //   );
        //   BlocProvider.of<DiscoverCubit>(context)
        //       .getVendorDiscover(search: value, loadingFromPagination: true
        //           //isInitial: true,
        //           );
        // },
        // onFieldSubmitted: (value) {
        //   BlocProvider.of<DiscoverCubit>(context).getFoodDiscover(
        //     search: value,
        //     isInitial: true,
        //   );
        //   BlocProvider.of<DiscoverCubit>(context).getVendorDiscover(
        //     search: value,
        //     loadingFromPagination: true,
        //     //isInitial: true,
        //   );
        // },
        decoration: InputDecoration(
          hintText: 'Find what you want',
          hintStyle: GoogleFonts.poppins(
            color: Colors.black.withValues(alpha: 0x000000B2),
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
