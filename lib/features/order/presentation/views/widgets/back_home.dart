import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grace_cycle/core/routes/app_routes.dart';
import 'package:grace_cycle/core/utils/app_colors.dart';
import 'package:grace_cycle/core/utils/app_text_styles.dart';

class BackHome extends StatelessWidget {
  const BackHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          Routes.home,
        );
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.arrow_back,
            color: AppColors.yellowForDetails,
            size: 25,
          ),
          Text(
            ' Back home',
            style: AppTextStyles.nunito600Size16White.copyWith(
              color: AppColors.yellowForDetails,
              fontSize: 17.sp,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
