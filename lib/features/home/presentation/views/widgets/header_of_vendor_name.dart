import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grace_cycle/core/routes/app_routes.dart';
import 'package:grace_cycle/features/Authentication/presentation/views/widgets/custom_yellow_text.dart';

class HeaderOfVendorName extends StatelessWidget {
  const HeaderOfVendorName({super.key, required this.title, });

  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: GoogleFonts.nunito(
              fontSize: 22.sp,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
          CustomYellowText(
            text2: 'See all',
            onPressed: () {
              Navigator.pushNamed(
                context,
                Routes.seeAll,
                arguments: true,
              );
            },
            fontsize: 18,
            fontWeight: FontWeight.w700,
          )
        ],
      ),
    );
  }
}
