import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grace_cycle/core/utils/app_colors.dart';
import 'package:grace_cycle/core/utils/app_spacing.dart';
import 'package:grace_cycle/features/Authentication/presentation/views/widgets/Question_text.dart';
import 'package:grace_cycle/features/Authentication/presentation/views/widgets/custom_button.dart';
import 'package:grace_cycle/features/Authentication/presentation/views/widgets/custom_checkbox.dart';
import 'package:grace_cycle/features/Authentication/presentation/views/widgets/custom_selection_container.dart';
import 'package:grace_cycle/features/Authentication/presentation/views/widgets/custom_text_form_field.dart';
import 'package:grace_cycle/features/Authentication/presentation/views/widgets/or_section.dart';

class SignupContinueBody extends StatelessWidget {
  const SignupContinueBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                'Sign Up',
                style: GoogleFonts.nunito(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.greentit,
                ),
              ),
              verticalSpace(20),
              CustomTextFormField(
                labelText: 'Location',
                hintText: 'Egypt , Cairo , Alf maskan',
                onChanged: (value) {},
                obscureText: false,
              ),
              verticalSpace(10),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'Your current location',
                  style: GoogleFonts.nunito(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    decoration: TextDecoration.underline,
                    color: AppColors.yellow,
                  ),
                ),
              ),
              verticalSpace(20),
              const CustomSelectionContainer(),
              verticalSpace(15),
              const CustomCheckbox(),
              verticalSpace(15),
              CustomButton(
                  text: 'Continue',
                  onPressed: () {},
                  textColor: Colors.white,
                  color: AppColors.greenButt),
              const QuestionText(
                  text1: 'Already have an account?', text2: 'Log in'),
              const OrSection(),
              verticalSpace(10),
              CustomButton(
                text: 'Google',
                onPressed: () {},
                textColor: AppColors.greensubtit,
                color: AppColors.secondgreenButt,
                image: 'assets/images/google.svg',
              )
            ],
          ),
        ),
      ),
    );
  }
}
