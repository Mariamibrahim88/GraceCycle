import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grace_cycle/core/utils/app_colors.dart';
import 'package:grace_cycle/core/utils/app_spacing.dart';
import 'package:grace_cycle/core/utils/app_text_styles.dart';
import 'package:grace_cycle/core/widgets/custom_app_bar.dart';
import 'package:grace_cycle/features/details/presentation/views/widgets/custom_rating_bar_of_write_review.dart';
import 'package:grace_cycle/features/discover/presentation/views/widgets/custom_search_text_field.dart';

class WriteReviewViewBody extends StatelessWidget {
  const WriteReviewViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.only(
            left: 12.w,
            right: 12.w,
            top: 22.h,
          ),
          child: Column(children: [
            verticalSpace(30.h),
            CustomAppBar(
              title: 'Wreite a review',
              fontStyle: 22.sp,
              color: Colors.black,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            verticalSpace(20.h),
            Row(
              children: [
                Stack(
                  children: [
                    CircleAvatar(
                      radius: 20.r,
                      child: Image.asset(
                        'assets/images/circle.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                    const Positioned(
                      right: 13,
                      bottom: 3,
                      child: Text(
                        'M',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                horizontalSpace(10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Ola Ahmed',
                      style: AppTextStyles.nunito700Size16Black,
                    ),
                    Text(
                      'Reviews are public and include your\naccount',
                      style: AppTextStyles.nunito400Size16Black,
                    ),
                  ],
                ),
              ],
            ),
            verticalSpace(15.h),
            const CustomRatingBarOfWriteReview(),
            verticalSpace(20.h),
            Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: TextFormField(
                maxLength: 500,
                onChanged: (value) {},
                onFieldSubmitted: (value) {},
                decoration: InputDecoration(
                  hintText: 'Describe your experience (optional)',
                  hintStyle: GoogleFonts.poppins(
                    color: Colors.black.withValues(alpha: 0.5),
                    fontSize: 14.sp,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.r),
                    borderSide: const BorderSide(color: Colors.black),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.r),
                    borderSide:
                        const BorderSide(color: AppColors.yellowForStar),
                  ),
                ),
                buildCounter: (
                  BuildContext context, {
                  required int currentLength,
                  required bool isFocused,
                  required int? maxLength,
                }) {
                  return Text(
                    '$currentLength / $maxLength',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                    ),
                  );
                },
              ),
            ),
            verticalSpace(200.h),
            GestureDetector(
              child: Container(
                width: double.infinity,
                height: 50.h,
                decoration: BoxDecoration(
                  color: AppColors.greenButt,
                  borderRadius: BorderRadius.circular(15.r),
                ),
                child: Center(
                  child: Text(
                    'Post',
                    style: AppTextStyles.nunito700Size16Black.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              onTap: () {},
            ),
          ]),
        ));
  }
}
