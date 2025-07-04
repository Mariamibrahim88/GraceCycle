import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grace_cycle/core/utils/app_colors.dart';
import 'package:grace_cycle/core/utils/app_spacing.dart';
import 'package:grace_cycle/core/utils/app_text_styles.dart';
import 'package:grace_cycle/features/favorites/presentation/manager/cubit/get_fav_cubit.dart';

class SortByContainerFav extends StatelessWidget {
  const SortByContainerFav(
      {super.key, required this.isExpanded, required this.nameOfSort});

  final bool isExpanded;
  final String nameOfSort;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetFavCubit, GetFavState>(
      builder: (context, state) {
        return Row(
          children: [
            Text('Sort by:', style: AppTextStyles.nunito400Size16Black),
            horizontalSpace(5),
            Container(
              height: 25.h,
              width: nameOfSort == 'Price' ? 70.w : 110.w,
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
                children: [
                  Icon(
                    isExpanded
                        ? Icons.keyboard_arrow_up
                        : Icons.keyboard_arrow_down,
                    color: isExpanded ? AppColors.greenButt : Colors.black,
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Text(
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
