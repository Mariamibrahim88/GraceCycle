import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grace_cycle/core/widgets/custom_shimmer_card.dart';

class CustomListOfShimmerVer extends StatelessWidget {
  const CustomListOfShimmerVer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h),
      child: Column(
        children: [
          Expanded(
            child: SizedBox(
              height: 293.h,
              // width: 400.w,
              child: ListView.builder(
                itemBuilder: (context, index) => Padding(
                  padding: EdgeInsets.only(
                    bottom: 40.h,
                  ),
                  child: const CustomShimmerCard(),
                ),
                itemCount: 4,
                scrollDirection: Axis.vertical,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
