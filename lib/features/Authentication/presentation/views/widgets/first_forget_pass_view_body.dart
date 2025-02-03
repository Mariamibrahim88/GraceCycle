import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grace_cycle/core/routes/app_routes.dart';
import 'package:grace_cycle/core/utils/app_assets.dart';
import 'package:grace_cycle/core/utils/app_colors.dart';
import 'package:grace_cycle/core/utils/app_navigate.dart';
import 'package:grace_cycle/core/utils/app_spacing.dart';
import 'package:grace_cycle/features/Authentication/presentation/views/widgets/question_text.dart';
import 'package:grace_cycle/features/Authentication/presentation/views/widgets/custom_button.dart';
import 'package:grace_cycle/features/Authentication/presentation/views/widgets/custom_text_form_field.dart';

class FirstForgetPassViewBody extends StatelessWidget {
  const FirstForgetPassViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 70.h),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Forget Password ?',
                style: GoogleFonts.nunito(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.greentit)),
            verticalSpace(15),
            Text(
                'Please enter your email address to \n receive a verification code',
                textAlign: TextAlign.center,
                style: GoogleFonts.nunito(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: AppColors.greentit)),
            verticalSpace(15),
            SvgPicture.asset(
              AppAssets.imgFoegetPass,
              height: 170,
            ),
            verticalSpace(15),
            CustomTextFormField(
              labelText: 'Email',
              hintText: 'Enter your email',
              onChanged: (value) {},
              obscureText: false,
            ),
            verticalSpace(20),
            CustomButton(
              text: 'Send',
              textColor: Colors.white,
              color: AppColors.greenButt,
              onPressed: () {
                navigate(context: context, route: Routes.verfiyYourEmail);
              },
            ),
            QuestionText(
              text1: 'Remember  password?',
              text2: 'Log in',
              onPressed: () {
                navigate(context: context, route: Routes.login);
              },
            ),
          ],
        ),
      ),
    );
  }
}
