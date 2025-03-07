import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grace_cycle/core/routes/app_routes.dart';
import 'package:grace_cycle/core/utils/app_assets.dart';
import 'package:grace_cycle/core/utils/app_colors.dart';
import 'package:grace_cycle/core/utils/app_navigate.dart';
import 'package:grace_cycle/core/utils/app_spacing.dart';
import 'package:grace_cycle/features/Authentication/presentation/views/widgets/custom_button.dart';

class SuccSetNewPassViewBody extends StatelessWidget {
  const SuccSetNewPassViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
        child: SingleChildScrollView(
          child: Column(
            children: [
              //const CustomAppBar(),
              //verticalSpace(20),
              Text('Congratulations !',
                  style: GoogleFonts.nunito(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.greentit)),
              verticalSpace(15),
              Text(
                  'Your password has been \n successfully reset . Click below to \n log in magically',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.nunito(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColors.greentit)),
              verticalSpace(15),
              SvgPicture.asset(
                AppAssets.imgCongratulation,
                height: 170,
              ),
              verticalSpace(25),
              CustomButton(
                text: 'Log In',
                textColor: Colors.white,
                color: AppColors.greenButt,
                onPressed: () {
                  navigate(context: context, route: Routes.login);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
