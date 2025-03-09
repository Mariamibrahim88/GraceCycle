import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grace_cycle/core/routes/app_routes.dart';
import 'package:grace_cycle/core/utils/app_assets.dart';
import 'package:grace_cycle/core/utils/app_colors.dart';
import 'package:grace_cycle/core/utils/app_navigate.dart';
import 'package:grace_cycle/core/utils/app_spacing.dart';
import 'package:grace_cycle/core/widgets/custom_app_bar.dart';
import 'package:grace_cycle/core/widgets/custom_loading.dart';
import 'package:grace_cycle/core/widgets/custom_snack_bar.dart';
import 'package:grace_cycle/features/Authentication/presentation/manager/login_cubit/login_cubit.dart';
import 'package:grace_cycle/features/Authentication/presentation/views/widgets/question_text.dart';
import 'package:grace_cycle/features/Authentication/presentation/views/widgets/custom_button.dart';
import 'package:grace_cycle/features/Authentication/presentation/views/widgets/custom_text_form_field.dart';
import 'package:grace_cycle/features/Authentication/presentation/views/widgets/custom_yellow_text.dart';
import 'package:grace_cycle/features/Authentication/presentation/views/widgets/or_section.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
        child: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state is LoginSuccessful) {
              showToast(
                  message: 'Login Successfully', state: ToastStates.success);
              navigateReplacement(context: context, route: Routes.home);
            } else if (state is LoginFailure) {
              //showSnackBar(context, state.toString(), Colors.red);
              showToast(
                  message: 'check your email or password',
                  state: ToastStates.error);
            } else if (state is LoginSuccessfulWithGoogle) {
              showToast(
                  message: 'Google Login Successfully',
                  state: ToastStates.success);
              navigate(context: context, route: Routes.home);
            } else if (state is LoginFailureWithGoogle) {
              showToast(
                  message: 'Google Login Failed: ${state.errorMessage}',
                  state: ToastStates.error);
            }
          },
          builder: (context, state) {
            return SingleChildScrollView(
              child: Form(
                key: context.read<LoginCubit>().formKey,
                child: Column(
                  children: [
                    // verticalSpace(10),
                    CustomAppBar(onPressed: () {
                      Navigator.pop(context);
                    }),
                    verticalSpace(50),
                    Text('Log In',
                        style: GoogleFonts.nunito(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                            color: AppColors.greentit)),
                    verticalSpace(40),
                    CustomTextFormField(
                      textcontroller:
                          context.read<LoginCubit>().emailController,
                      labelText: 'Email',
                      hintText: 'Enter your email',
                      obscureText: false,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Email is required';
                        } else if (!value.contains('@')) {
                          return 'Invalid Email';
                        }
                        return null;
                        // return null;
                      },
                    ),
                    verticalSpace(15),
                    CustomTextFormField(
                      textcontroller:
                          context.read<LoginCubit>().passwordController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Password is required';
                        } else if (value.length < 6) {
                          return 'Password must be at least 6 characters';
                        }
                        return null;
                      },
                      labelText: 'Password',
                      hintText: 'Enter your password',
                      obscureText: true,
                    ),
                    verticalSpace(5),
                    Align(
                        alignment: Alignment.centerRight,
                        child: CustomYellowText(
                            text2: 'Forgot Password?',
                            onPressed: () {
                              navigate(
                                  context: context,
                                  route: Routes.firstForgetPass);
                            })),
                    verticalSpace(15),
                    state is LoginLoading
                        ? const CustomLoading()
                        : CustomButton(
                            text: 'Log in',
                            textColor: Colors.white,
                            color: AppColors.greenButt,
                            onPressed: () {
                              if (context
                                  .read<LoginCubit>()
                                  .formKey
                                  .currentState!
                                  .validate()) {
                                BlocProvider.of<LoginCubit>(context).login();
                              }
                            },
                          ),
                    verticalSpace(5),
                    QuestionText(
                      text1: 'Don’t have an account?',
                      text2: 'Sign Up',
                      onPressed: () {
                        navigate(context: context, route: Routes.signup);
                      },
                    ),
                    const OrSection(),
                    verticalSpace(10),
                    state is LoginLoadingWithGoogle
                        ? const CustomLoading()
                        : CustomButton(
                            text: 'Google',
                            onPressed: () {
                              BlocProvider.of<LoginCubit>(context)
                                  .loginWithGoogle();
                            },
                            textColor: AppColors.greensubtit,
                            image: AppAssets.imgGoogle,
                            color: AppColors.grey),
                    verticalSpace(50),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
