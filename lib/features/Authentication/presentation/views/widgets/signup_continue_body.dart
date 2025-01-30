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
import 'package:grace_cycle/features/Authentication/presentation/views/widgets/question_text.dart';
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
        child: BlocConsumer<RegisterCubit, RegisterState>(
          listener: (context, state) {
            if (state is RegisterSucessState) {
              showToast(
                  message: 'Sign Up Successful', state: ToastStates.success);
              // navigateRepacement(context: context, route: Routes.home);
            } else if (state is RegisterErrorState) {
              showToast(message: state.message, state: ToastStates.error);
            }
          },
          builder: (context, state) {
            return SingleChildScrollView(
              child: Form(
                key: context.read<RegisterCubit>().formTwoKey,
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
                      textcontroller:
                          context.read<RegisterCubit>().addressController,
                      hintText: 'Egypt , Cairo , Alf maskan',
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'please enter your location';
                        }
                        return null;
                      },
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
                        text: 'Sign up',
                        onPressed: () {
                          if (BlocProvider.of<RegisterCubit>(context)
                              .formTwoKey
                              .currentState!
                              .validate()) {
                            BlocProvider.of<RegisterCubit>(context).register();
                          }
                        },
                        textColor: Colors.white,
                        color: AppColors.greenButt),
                    QuestionText(
                        text1: 'Already have an account?',
                        text2: 'Log in',
                        onPressed: () {
                          navigate(context: context, route: Routes.login);
                        }),
                    const OrSection(),
                    verticalSpace(10),
                    CustomButton(
                      text: 'Google',
                      onPressed: () {},
                      textColor: AppColors.greensubtit,
                      color: AppColors.grey,
                      image: AppAssets.imgGoogle,
                    )
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
