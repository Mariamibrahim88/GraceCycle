import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grace_cycle/core/routes/app_routes.dart';
import 'package:grace_cycle/core/utils/app_colors.dart';
import 'package:grace_cycle/core/utils/app_navigate.dart';
import 'package:grace_cycle/core/utils/app_spacing.dart';
import 'package:grace_cycle/core/widgets/custom_app_bar.dart';
import 'package:grace_cycle/features/Authentication/presentation/views/widgets/custom_button.dart';
import 'package:grace_cycle/features/Authentication/presentation/views/widgets/custom_yellow_text.dart';
import 'package:grace_cycle/features/onBourding/presentation/views/components/onBourding_data.dart';

class OnbourdingBody extends StatefulWidget {
  const OnbourdingBody({super.key});

  @override
  State<OnbourdingBody> createState() => _OnbourdingBodyState();
}

class _OnbourdingBodyState extends State<OnbourdingBody> {
  final controller = OnbourdingData();
  final pageController = PageController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: PageView.builder(
            onPageChanged: (value) {
              setState(() {
                currentIndex = value;
              });
            },
            controller: pageController,
            itemCount: controller.items.length,
            itemBuilder: (context, index) => index == 1
                ? _buildSpecialPage(index)
                : _buildDefaultPage(index),
          ),
        ),
      ],
    );
  }

  Widget _buildSpecialPage(int index) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 45.0, left: 10.0),
              child: GestureDetector(
                onTap: () => pageController.previousPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeIn,
                ),
                child: const Icon(
                  Icons.arrow_back_outlined,
                  size: 32,
                ),
              ),
            ),
            SizedBox(
              height: 300.h,
              width: 275.w,
              child: SvgPicture.asset(controller.items[index].image),
            ),
          ],
        ),
        verticalSpace(65),
        buildDots(),
        verticalSpace(24),
        _buildContent(index),
      ],
    );
  }

  Widget _buildDefaultPage(int index) {
    return Column(
      children: [
        CustomAppBar(
          onPressed: () {
            currentIndex == 0
                ? Navigator.pop(context)
                : pageController.previousPage(
                    duration: const Duration(milliseconds: 700),
                    curve: Curves.easeIn,
                  );
          },
        ),
        Padding(
          padding: currentIndex == 0
              ? const EdgeInsets.only(right: 20)
              : currentIndex == 2
                  ? const EdgeInsets.only(left: 20)
                  : const EdgeInsets.symmetric(horizontal: 20),
          child: SvgPicture.asset(controller.items[index].image,
              height: 300.h, width: 275.w),
        ),
        verticalSpace(20),
        buildDots(),
        verticalSpace(24),
        _buildContent(index),
      ],
    );
  }

  Widget _buildContent(int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Text(
            controller.items[index].title,
            style: TextStyle(
              fontSize: 22.sp,
              color: AppColors.greentit,
              fontFamily: 'OtomanopeeOne',
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 16.h),
          Text(
            controller.items[index].description,
            textAlign: TextAlign.center,
            style: GoogleFonts.nunito(
              fontSize: 16.sp,
              color: AppColors.grey3,
              fontWeight: FontWeight.w400,
            ),
          ),
          verticalSpace(24),
          CustomButton(
            text: 'Continue',
            onPressed: () {
              currentIndex == 2
                  ? navigate(context: context, route: Routes.signup)
                  : pageController.nextPage(
                      duration: const Duration(milliseconds: 700),
                      curve: Curves.easeIn,
                    );
            },
            textColor: Colors.white,
            color: AppColors.greenButt,
          ),
          verticalSpace(20),
          CustomYellowText(
            text2: 'Skip',
            fontsize: 18,
            onPressed: () => navigate(context: context, route: Routes.signup),
          ),
        ],
      ),
    );
  }

  Widget buildDots() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        controller.items.length,
        (index) => AnimatedContainer(
          duration: const Duration(milliseconds: 700),
          margin: const EdgeInsets.only(right: 5),
          height: 5.h,
          width: currentIndex == index ? 20.w : 5.w,
          decoration: BoxDecoration(
            color: currentIndex == index
                ? AppColors.yellow
                : AppColors.secondgreenItself,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
