import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grace_cycle/core/utils/app_text_styles.dart';

class ListOfNameOfFoodCheckout extends StatelessWidget {
  const ListOfNameOfFoodCheckout({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 6,
      itemBuilder: (context, index) => Padding(
        padding: EdgeInsets.only(
          bottom: 10.h,
        ),
        child: Row(
          children: [
            Text('Mushroom Soup *3', style: AppTextStyles.nunito500Size18Black),
            const Spacer(),
            Text('EGP 20', style: AppTextStyles.nunito500Size18Black),
          ],
        ),
      ),
    );
  }
}
