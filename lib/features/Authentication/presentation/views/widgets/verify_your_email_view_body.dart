import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grace_cycle/core/routes/app_routes.dart';
import 'package:grace_cycle/core/utils/app_assets.dart';
import 'package:grace_cycle/core/utils/app_colors.dart';
import 'package:grace_cycle/core/utils/app_navigate.dart';
import 'package:grace_cycle/core/utils/app_spacing.dart';
import 'package:grace_cycle/features/Authentication/presentation/views/widgets/Question_text.dart';
import 'package:grace_cycle/features/Authentication/presentation/views/widgets/custom_button.dart';

class VerifyYourEmailViewBody extends StatelessWidget {
  const VerifyYourEmailViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 40.h),
      child: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          // const CustomAppBar(),

          Text('Verify your Email',
              style: GoogleFonts.nunito(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.greentit)),
          verticalSpace(15),
          Text('Please enter the verification code \n sent to your email',
              textAlign: TextAlign.center,
              style: GoogleFonts.nunito(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: AppColors.greentit)),
          verticalSpace(15),
          SvgPicture.asset(
            AppAssets.imgVerifyYourEmail,
            height: 170,
          ),
          verticalSpace(20),
          OtpTextField(
            showFieldAsBox: true,
            fieldHeight: 40,
            fieldWidth: 40,
            numberOfFields: 4,
            textStyle: GoogleFonts.nunito(
              fontSize: 22,
              fontWeight: FontWeight.w700,
              color: AppColors.greenButt,
            ),
            hasCustomInputDecoration: true,
            decoration: InputDecoration(
              counterText: '',
              contentPadding: const EdgeInsets.only(left: 2),
              filled: true,
              fillColor: Colors.transparent,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(2),
                borderSide: const BorderSide(
                  color: AppColors.grey,
                  width: 1.5,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(2),
                borderSide: const BorderSide(
                  color: AppColors.greenButt,
                  width: 1.5,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(2),
                borderSide: const BorderSide(
                  color: AppColors.greenButt,
                  width: 1.5,
                ),
              ),

              // disabledBorder: OutlineInputBorder(
              //   borderRadius: BorderRadius.circular(2),
              //   borderSide: const BorderSide(
              //     color: AppColors.greenButt,
              //     width: 1.5,
              //   ),
              // ),
            ),
          ),
          verticalSpace(20),
          CustomButton(
            text: 'Verify',
            textColor: Colors.white,
            color: AppColors.greenButt,
            onPressed: () {
              navigate(context: context, route: Routes.setNewPass);
            },
          ),
          QuestionText(
            text1: 'Didn’t receive the email ?',
            text2: 'Resend code',
            onPressed: () {},
          ),
        ]),
      ),
    );
  }
}
