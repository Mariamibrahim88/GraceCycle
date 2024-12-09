import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grace_cycle/core/routes/app_routes.dart';
import 'package:grace_cycle/core/utils/app_colors.dart';
import 'package:grace_cycle/core/utils/app_navigate.dart';
import 'package:grace_cycle/core/utils/app_spacing.dart';
import 'package:grace_cycle/features/Authentication/presentation/views/widgets/Question_text.dart';
import 'package:grace_cycle/features/Authentication/presentation/views/widgets/custom_button.dart';
import 'package:grace_cycle/features/Authentication/presentation/views/widgets/custom_text_form_field.dart';
import 'package:grace_cycle/features/Authentication/presentation/views/widgets/or_section.dart';

class SignupViewBody extends StatelessWidget {
  const SignupViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
        child: SingleChildScrollView(
          child: Column(
            children: [
              //verticalSpace(100),
              Text('Sign Up',
                  style: GoogleFonts.nunito(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.greentit)),
              verticalSpace(30),
              CustomTextFormField(
                labelText: 'Name',
                hintText: 'Mariam Ibrahim',
                onChanged: (value) {},
                obscureText: false,
                //icon: Icons.email,
              ),
              verticalSpace(15),
              CustomTextFormField(
                labelText: 'Phone',
                hintText: '+20 101 234 5678',
                onChanged: (value) {},
                obscureText: false,
                //icon: Icons.email,
              ),
              verticalSpace(15),
              CustomTextFormField(
                labelText: 'Email',
                hintText: 'mariam@gmail.com',
                onChanged: (value) {},
                obscureText: false,
                //icon: Icons.email,
              ),
              verticalSpace(15),
              CustomTextFormField(
                labelText: 'Password',
                hintText: 'anything122',
                onChanged: (value) {},
                obscureText: true,
                // icon: Icons.email,
              ),
              verticalSpace(15),
              CustomTextFormField(
                labelText: 'Confirm Password',
                hintText: 'anything122',
                onChanged: (value) {},
                obscureText: true,
                //icon: Icons.email,
              ),
              verticalSpace(25),
              CustomButton(
                text: 'Continue',
                textColor: Colors.white,
                color: AppColors.greenButt,
                onPressed: () {
                  navigate(context: context, route: Routes.continueSignup);
                },
              ),
              verticalSpace(5),
              const QuestionText(
                text1: 'Already have an account?',
                text2: 'Log in',
              ),

              //verticalSpace(20),
              const OrSection(),
              verticalSpace(10),

              CustomButton(
                  text: 'Google',
                  onPressed: () {},
                  textColor: AppColors.greensubtit,
                  image: 'assets/images/google.svg',
                  color: AppColors.grey),
            ],
          ),
        ),
      ),
    );
  }
}
