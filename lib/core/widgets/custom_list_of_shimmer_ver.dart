import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grace_cycle/core/widgets/custom_shimmer_card_fav.dart';

class CustomListOfShimmerFavVer extends StatelessWidget {
  const CustomListOfShimmerFavVer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 20.h),
      child: Row(
        children: [
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.symmetric(vertical: 5.w),
                child: const CustomShimmerCardFav(),
              ),
              itemCount: 4,
              scrollDirection: Axis.vertical,
            ),
          ),
        ],
      ),
    );
  }
}
