import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grace_cycle/core/utils/app_colors.dart';

class CustomSearchTextFieldFav extends StatelessWidget {
  const CustomSearchTextFieldFav({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: TextFormField(
        cursorColor: AppColors.greenButt,
        // controller: BlocProvider.of<DiscoverCubit>(context).serachController,
        onChanged: (value) {},
        onFieldSubmitted: (value) {},
        decoration: InputDecoration(
          hintText: 'Find what you want',
          hintStyle: GoogleFonts.poppins(
            color: Colors.black.withOpacity(0.5),
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
