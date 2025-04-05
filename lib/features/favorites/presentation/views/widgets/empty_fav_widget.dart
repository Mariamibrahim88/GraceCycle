import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grace_cycle/core/utils/app_assets.dart';
import 'package:grace_cycle/core/utils/app_spacing.dart';
import 'package:grace_cycle/core/utils/app_text_styles.dart';

class EmptyFavWidget extends StatelessWidget {
  const EmptyFavWidget({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            AppAssets.emptyFav,
            width: 150.w,
            height: 150.h,
          ),
          verticalSpace(10),
          Text(
            title,
            style: AppTextStyles.nunito700Size16Black,
          ),
        ],
      ),
    );
  }
}
