import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grace_cycle/core/utils/app_spacing.dart';
import 'package:grace_cycle/features/details/presentation/views/widgets/custom_list_item_offered.dart';
import 'package:grace_cycle/features/details/presentation/views/widgets/green_butt_text.dart';
import 'package:grace_cycle/features/details/presentation/views/widgets/yellow_title.dart';

class ItemsOfferedSection extends StatelessWidget {
  const ItemsOfferedSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        YellowTitle(
          title: 'Items Offered',
          leftPadding: 30.w,
        ),
        verticalSpace(5.h),
        const CustomListItemOffered(),
        verticalSpace(5.h),
        GreenButtText(
          text: 'See all items',
          leftPadding: 30.w,
        ),
      ],
    );
  }
}
