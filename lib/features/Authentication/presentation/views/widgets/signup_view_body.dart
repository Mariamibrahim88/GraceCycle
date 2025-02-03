import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grace_cycle/core/routes/app_routes.dart';
import 'package:grace_cycle/core/utils/app_assets.dart';
import 'package:grace_cycle/core/utils/app_colors.dart';
import 'package:grace_cycle/core/utils/app_navigate.dart';
import 'package:grace_cycle/core/utils/app_spacing.dart';
import 'package:grace_cycle/core/widgets/custom_snack_bar.dart';
import 'package:grace_cycle/features/Authentication/presentation/manager/register_cubit/register_cubit.dart';
import 'package:grace_cycle/features/Authentication/presentation/manager/register_cubit/register_state.dart';
import 'package:grace_cycle/features/Authentication/presentation/views/signup_continue_view.dart';
import 'package:grace_cycle/features/Authentication/presentation/views/widgets/question_text.dart';
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
        child: BlocBuilder<RegisterCubit, RegisterState>(
          builder: (context, state) {
            return SingleChildScrollView(
              child: Form(
                key: context.read<RegisterCubit>().formKey,
                child: Column(
                  children: [
                    Text('Sign Up',
                        style: GoogleFonts.nunito(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                            color: AppColors.greentit)),
                    verticalSpace(30),
                    CustomTextFormField(
                      labelText: 'Name',
                      hintText: 'Enter your name',
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Name is required';
                        }
                        return null;
                      },

                      textcontroller:
                          context.read<RegisterCubit>().usernameController,

                      obscureText: false,
                      //icon: Icons.email,
                    ),
                    verticalSpace(15),
                    CustomTextFormField(
                      labelText: 'Phone',
                      keyboardType: TextInputType.phone,
                      hintText: 'Enter your phone number',
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Phone number is required';
                        }
                        return null;
                      },
                      textcontroller:
                          context.read<RegisterCubit>().phonenumberController,
                      obscureText: false,
                      //icon: Icons.email,
                    ),
                    verticalSpace(15),
                    CustomTextFormField(
                      labelText: 'Email',
                      hintText: 'Enter your email',
                      textcontroller:
                          context.read<RegisterCubit>().emailController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Email is required';
                        } else if (!value.contains('@') ||
                            (!value.contains('gmail.com'))) {
                          return 'Invalid Email';
                        }
                        return null;
                      },
                      obscureText: false,
                      //icon: Icons.email,
                    ),
                    verticalSpace(15),
                    CustomTextFormField(
                      labelText: 'Password',
                      hintText: 'Enter your password',
                      textcontroller:
                          context.read<RegisterCubit>().passwordController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Password is required';
                        } else if (value.length < 6) {
                          return 'Password must be at least 6 characters';
                        }
                        return null;
                      },
                      obscureText: true,
                      // icon: Icons.email,
                    ),
                    verticalSpace(15),
                    CustomTextFormField(
                      labelText: 'Confirm Password',
                      hintText: 'Enter your password again',
                      validator: (value) {
                        if (value!.length < 6 || value.isEmpty) {
                          return 'Enter valid Password';
                        } else if (value !=
                            BlocProvider.of<RegisterCubit>(context)
                                .passwordController
                                .text) {
                          return 'Must match password';
                        }
                        return null;
                      },

                      obscureText: true,
                      //icon: Icons.email,
                    ),
                    verticalSpace(25),
                    CustomButton(
                      text: 'Continue',
                      textColor: Colors.white,
                      color: AppColors.greenButt,
                      onPressed: () {
                        final registerCubit =
                            BlocProvider.of<RegisterCubit>(context);

                        if (registerCubit.formKey.currentState!.validate()) {
                          registerCubit.formKey.currentState!.save();

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BlocProvider.value(
                                value: registerCubit,
                                child: const SignupContinueView(),
                              ),
                            ),
                          );
                        }
                      },
                    ),
                    verticalSpace(5),
                    QuestionText(
                      text1: 'Already have an account?',
                      text2: 'Log in',
                      onPressed: () {
                        // BlocProvider.of<LoginCubit>(context).login();
                        navigate(context: context, route: Routes.login);
                      },
                    ),

                    //verticalSpace(20),
                    const OrSection(),
                    verticalSpace(10),

                    CustomButton(
                        text: 'Google',
                        onPressed: () {
                          showToast(
                              message: 'Sign Up Successful',
                              state: ToastStates.success);
                        },
                        textColor: AppColors.greensubtit,
                        image: AppAssets.imgGoogle,
                        color: AppColors.grey),
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
