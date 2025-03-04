import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
import 'package:grace_cycle/features/Authentication/presentation/views/widgets/custom_text_form_field.dart';

class FirstForgetPassViewBody extends StatelessWidget {
  const FirstForgetPassViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 70.h),
      child: BlocConsumer<ForgetPassCubit, ForgetPassState>(
        listener: (context, state) {
          if (state is ForgetPassSuccessState) {
            navigate(context: context, route: Routes.verfiyYourEmail);
          } else if (state is ForgetPassFailedState) {
            showToast(message: state.message, state: ToastStates.error);
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: Form(
              key: context.read<ForgetPassCubit>().formFirstKey,
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
                    textcontroller:
                        context.read<ForgetPassCubit>().emailController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Email is required';
                      } else if (!value.contains('@') ||
                          (!value.contains('gmail.com'))) {
                        return 'Invalid Email';
                      }
                      return null;
                    },
                    labelText: 'Email',
                    hintText: 'Enter your email',
                    onChanged: (value) {},
                    obscureText: false,
                  ),
                  verticalSpace(20),
                  state is ForgetPassLoadingState
                      ? const CustomLoading()
                      : CustomButton(
                          text: 'Send',
                          textColor: Colors.white,
                          color: AppColors.greenButt,
                          onPressed: () {
                            if (context
                                .read<ForgetPassCubit>()
                                .formFirstKey
                                .currentState!
                                .validate()) {
                              BlocProvider.of<ForgetPassCubit>(context)
                                  .forgetPassword();
                            }
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
        },
      ),
    );
  }
}
