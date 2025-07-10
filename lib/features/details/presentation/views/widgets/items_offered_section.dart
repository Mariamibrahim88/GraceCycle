import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grace_cycle/core/utils/app_spacing.dart';
import 'package:grace_cycle/features/details/data/models/vendor_item_details_model.dart';
import 'package:grace_cycle/features/details/presentation/views/widgets/custom_list_item_offered.dart';
import 'package:grace_cycle/features/details/presentation/views/widgets/green_butt_text.dart';
import 'package:grace_cycle/features/details/presentation/views/widgets/yellow_title.dart';

class ItemsOfferedSection extends StatelessWidget {
  const ItemsOfferedSection({
    super.key,
    required this.offeredItemList,
  });
  final List<OfferedItem> offeredItemList;

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
        offeredItemList.isNotEmpty
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomListItemOffered(
                    offeredItemList: offeredItemList,
                  ),
                  verticalSpace(5.h),
                  GreenButtText(
                    text: 'See all items',
                    leftPadding: 30.w,
                  ),
                ],
              )
            : Center(
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 18.w, vertical: 14.h),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF2FBF8), // Light mint background
                    border: Border.all(
                        color: const Color.fromARGB(255, 50, 112, 88),
                        width: 1.2),
                    borderRadius: BorderRadius.circular(12.r),
                    boxShadow: [
                      BoxShadow(
                        color: const Color.fromARGB(255, 50, 112, 88)
                            .withOpacity(0.1),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.info_outline,
                        color: const Color.fromARGB(255, 50, 112, 88),
                        size: 20.sp,
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        'No items offered at the moment.',
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w600,
                          color: const Color.fromARGB(255, 50, 112, 88),
                          letterSpacing: 0.3,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
      ],
    );
  }
}
