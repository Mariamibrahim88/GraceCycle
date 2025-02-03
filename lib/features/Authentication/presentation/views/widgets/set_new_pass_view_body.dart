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
import 'package:grace_cycle/features/Authentication/presentation/views/widgets/custom_text_form_field.dart';

class SetNewPassViewBody extends StatelessWidget {
  const SetNewPassViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 70.h),
      child: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Text('Set new Password',
              style: GoogleFonts.nunito(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.greentit)),
          verticalSpace(25),
          SvgPicture.asset(
            AppAssets.imgSetNewPass,
            height: 170,
          ),
          verticalSpace(25),
          CustomTextFormField(
            labelText: 'New Password',
            hintText: 'Enter your new password',
            onChanged: (value) {},
            obscureText: true,
          ),
          verticalSpace(15),
          CustomTextFormField(
            labelText: 'Confirm Password',
            hintText: 'Enter your new password again',
            onChanged: (value) {},
            obscureText: true,
          ),
          verticalSpace(20),
          CustomButton(
            text: 'Save',
            textColor: AppColors.basicWhite,
            color: AppColors.greenButt,
            onPressed: () {
              navigate(context: context, route: Routes.succSetNewPass);
            },
          ),
        ]),
      ),
    );
  }
}
