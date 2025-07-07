import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grace_cycle/core/utils/app_colors.dart';
import 'package:grace_cycle/core/utils/app_text_styles.dart';
import 'package:grace_cycle/features/discover/presentation/manager/discover_cubit/discover_cubit.dart';

class SortByContainer extends StatelessWidget {
  const SortByContainer({
    super.key,
    required this.isExpanded,
    required this.nameOfSort,
  });

  final bool isExpanded;
  final String nameOfSort;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DiscoverCubit, DiscoverState>(
      builder: (context, state) {
        return Row(
          children: [
            Text('Sort by:', style: AppTextStyles.nunito400Size16Black),
            Container(
              height: 25.h,
              width: nameOfSort == 'Price'
                      ? 70.w
                      : 110.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  color: AppColors.sortColor,
                  border: Border.all(
                    color: AppColors.greensubtit,
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: AppColors.secondgreenItself,
                      blurRadius: 2,
                      offset: Offset(0, 2),
                    ),
                  ]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    isExpanded
                        ? Icons.keyboard_arrow_up
                        : Icons.keyboard_arrow_down,
                    color: isExpanded ? AppColors.greenButt : Colors.black,
                  ),
                  Text(
                    nameOfSort,
                    textAlign: TextAlign.center,
                    style: isExpanded
                        ? AppTextStyles.nunito500Size14Black.copyWith(
                            color: AppColors.greenButt,
                            fontSize: 12.sp,
                          )
                        : AppTextStyles.nunito500Size14Black.copyWith(
                            fontSize: 12.sp,
                          ),
                  ),
                ],
              ),
            )
          ],
        );
      },
    );
  }
}
