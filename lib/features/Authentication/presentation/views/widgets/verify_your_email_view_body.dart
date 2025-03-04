import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grace_cycle/core/routes/app_routes.dart';
import 'package:grace_cycle/core/utils/app_assets.dart';
import 'package:grace_cycle/core/utils/app_colors.dart';
import 'package:grace_cycle/core/utils/app_navigate.dart';
import 'package:grace_cycle/core/utils/app_spacing.dart';
import 'package:grace_cycle/core/widgets/custom_loading.dart';
import 'package:grace_cycle/core/widgets/custom_snack_bar.dart';
import 'package:grace_cycle/features/Authentication/presentation/manager/forget_pass_cubit/forget_pass_cubit.dart';
import 'package:grace_cycle/features/Authentication/presentation/views/widgets/question_text.dart';
import 'package:grace_cycle/features/Authentication/presentation/views/widgets/custom_button.dart';

class VerifyYourEmailViewBody extends StatelessWidget {
  const VerifyYourEmailViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 70.h),
      child: BlocConsumer<ForgetPassCubit, ForgetPassState>(
        listener: (context, state) {
          if (state is ForgetPassSuccessState) {
            navigate(context: context, route: Routes.setNewPass);
          } else if (state is ForgetPassFailedState) {
            showToast(message: state.message, state: ToastStates.error);
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: Form(
              key: context.read<ForgetPassCubit>().formSecondKey,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Verify your Email',
                        style: GoogleFonts.nunito(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: AppColors.greentit)),
                    verticalSpace(15),
                    Text(
                        'Please enter the verification code \n sent to your email',
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
                    buildOtpInput(context),
                    // OtpTextField(
                    //   showFieldAsBox: true,
                    //   fieldHeight: 40,
                    //   fieldWidth: 40,
                    //   numberOfFields: 4,
                    //   textStyle: GoogleFonts.nunito(
                    //     fontSize: 22,
                    //     fontWeight: FontWeight.w700,
                    //     color: AppColors.greenButt,
                    //   ),
                    //   hasCustomInputDecoration: true,
                    //   decoration: InputDecoration(
                    //     counterText: '',
                    //     contentPadding: const EdgeInsets.only(left: 2),
                    //     filled: true,
                    //     fillColor: Colors.transparent,
                    //     // border: OutlineInputBorder(
                    //     //   borderRadius: BorderRadius.circular(2),
                    //     //   borderSide: const BorderSide(
                    //     //     color: AppColors.grey,
                    //     //     width: 1.5,
                    //     //   ),
                    //     // ),
                    //     focusedBorder: OutlineInputBorder(
                    //       borderRadius: BorderRadius.circular(2),
                    //       borderSide: const BorderSide(
                    //         color: AppColors.greenButt,
                    //         width: 1.5,
                    //       ),
                    //     ),
                    //     enabledBorder: OutlineInputBorder(
                    //       borderRadius: BorderRadius.circular(2),
                    //       borderSide: const BorderSide(
                    //         color: AppColors.grey,
                    //         width: 1.5,
                    //       ),
                    //     ),

                    //     // disabledBorder: OutlineInputBorder(
                    //     //   borderRadius: BorderRadius.circular(2),
                    //     //   borderSide: const BorderSide(
                    //     //     color: AppColors.greenButt,
                    //     //     width: 1.5,
                    //     //   ),
                    //     // ),
                    //   ),
                    // ),
                    verticalSpace(20),
                    state is ForgetPassLoadingState
                        ? const CustomLoading()
                        : CustomButton(
                            text: 'Verify',
                            textColor: Colors.white,
                            color: AppColors.greenButt,
                            onPressed: () {
                              if (context
                                  .read<ForgetPassCubit>()
                                  .formSecondKey
                                  .currentState!
                                  .validate()) {
                                BlocProvider.of<ForgetPassCubit>(context)
                                    .verfiyCode();
                              }
                            },
                          ),
                    QuestionText(
                      text1: 'Didn’t receive the email ?',
                      text2: 'Resend code',
                      onPressed: () {
                        if (context
                            .read<ForgetPassCubit>()
                            .formSecondKey
                            .currentState!
                            .validate()) {
                          BlocProvider.of<ForgetPassCubit>(context)
                              .forgetPassword();
                        }
                      },
                    ),
                  ]),
            ),
          );
        },
      ),
    );
  }
}

Widget buildOtpInput(BuildContext context) {
  return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(4, (index) {
        return Container(
          width: 50,
          height: 50,
          margin: const EdgeInsets.symmetric(horizontal: 5),
          child: TextFormField(
            controller: context.read<ForgetPassCubit>().otpControllers[index],
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            style: GoogleFonts.nunito(
              fontSize: 22,
              fontWeight: FontWeight.w700,
              color: AppColors.greenButt,
            ),
            maxLength: 1,
            decoration: InputDecoration(
              counterText: '',
              filled: true,
              fillColor: Colors.transparent,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: const BorderSide(
                  color: AppColors.greenButt,
                  width: 1.5,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: const BorderSide(
                  color: AppColors.grey,
                  width: 1.5,
                ),
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return '';
              }
              return null;
            },
            onChanged: (value) {
              if (value.isNotEmpty && index < 3) {
                FocusScope.of(context).nextFocus();
              } else if (value.isEmpty && index > 0) {
                FocusScope.of(context).previousFocus();
              }
            },
          ),
        );
      }));
}
