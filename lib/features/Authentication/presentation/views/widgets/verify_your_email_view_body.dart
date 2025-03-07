import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grace_cycle/core/utils/app_assets.dart';
import 'package:grace_cycle/core/utils/app_colors.dart';
import 'package:grace_cycle/core/utils/app_spacing.dart';
import 'package:grace_cycle/core/widgets/custom_app_bar.dart';
import 'package:grace_cycle/core/widgets/custom_loading.dart';
import 'package:grace_cycle/core/widgets/custom_snack_bar.dart';
import 'package:grace_cycle/features/Authentication/presentation/manager/forget_pass_cubit/forget_pass_cubit.dart';
import 'package:grace_cycle/features/Authentication/presentation/views/set_new_pass_view.dart';
import 'package:grace_cycle/features/Authentication/presentation/views/widgets/question_text.dart';
import 'package:grace_cycle/features/Authentication/presentation/views/widgets/custom_button.dart';

class VerifyYourEmailViewBody extends StatelessWidget {
  const VerifyYourEmailViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final formSecondtKey = GlobalKey<FormState>();
    final cubit = context.read<ForgetPassCubit>();

    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
        //padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 70.h),
        child: BlocConsumer<ForgetPassCubit, ForgetPassState>(
          listener: (context, state) {
            if (state is VerifyCodeSuccessState) {
              showToast(
                  message: 'Your email is verified',
                  state: ToastStates.success);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BlocProvider.value(
                    value: cubit,
                    child: const SetNewPassView(),
                  ),
                ),
              );
              //navigate(context: context, route: Routes.setNewPass);
            } else if (state is VerifyCodeFailedState) {
              showToast(message: state.message, state: ToastStates.error);
            }
          },
          builder: (context, state) {
            var cubit = context.read<ForgetPassCubit>();
            return SingleChildScrollView(
              child: Form(
                key: formSecondtKey,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomAppBar(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      verticalSpace(50),
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
                      // Text(
                      //     "Your email is: ${cubit.emailController.text}"), // تأكد من عرضه
                      buildOtpInput(context),
                      verticalSpace(20),
                      state is VerifyCodeLoadingState
                          ? const CustomLoading()
                          : CustomButton(
                              text: 'Verify',
                              textColor: Colors.white,
                              color: AppColors.greenButt,
                              onPressed: () {
                                if (formSecondtKey.currentState!.validate()) {
                                  BlocProvider.of<ForgetPassCubit>(context)
                                      .verfiyCode();
                                } else {
                                  showToast(
                                      message: 'please fill in all fields ',
                                      state: ToastStates.error);
                                }
                              }),
                      QuestionText(
                        text1: 'Didn’t receive the email ?',
                        text2: 'Resend code',
                        onPressed: () {
                          cubit.forgetPassword();
                        },
                      ),
                      verticalSpace(30),
                    ]),
              ),
            );
          },
        ),
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
              fontSize: 20.sp,
              fontWeight: FontWeight.w700,
              color: AppColors.greenButt,
            ),
            maxLength: 1,
            decoration: InputDecoration(
              counterText: '',
              filled: true,
              fillColor: Colors.transparent,
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(2),
                borderSide: const BorderSide(
                  color: Colors.red,
                  width: 2,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(2),
                borderSide: const BorderSide(
                  color: Colors.red,
                  width: 2,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(2),
                borderSide: const BorderSide(
                  color: AppColors.greenButt,
                  width: 2,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(2),
                borderSide: const BorderSide(
                  color: AppColors.grey,
                  width: 2,
                ),
              ),
              errorStyle: const TextStyle(fontSize: 0),
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
