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
import 'package:grace_cycle/core/widgets/custom_snack_bar.dart';
import 'package:grace_cycle/features/Authentication/presentation/manager/forget_pass_cubit/forget_pass_cubit.dart';
import 'package:grace_cycle/features/Authentication/presentation/views/widgets/custom_button.dart';
import 'package:grace_cycle/features/Authentication/presentation/views/widgets/custom_text_form_field.dart';

class SetNewPassViewBody extends StatelessWidget {
  const SetNewPassViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    final formThirdKey = GlobalKey<FormState>();
    final cubit = context.read<ForgetPassCubit>();

    return BlocConsumer<ForgetPassCubit, ForgetPassState>(
      listener: (context, state) {
        if (state is ForgetPassSuccessState) {
          showToast(
              message: 'Set new password successfully',
              state: ToastStates.success);

          navigate(context: context, route: Routes.succSetNewPass);
        } else if (state is ForgetPassFailedState) {
          showToast(message: state.message, state: ToastStates.error);
        }
      },
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 70.h),
          child: SingleChildScrollView(
            child: Form(
              key: formThirdKey,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Set new Password',
                        style: GoogleFonts.nunito(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: AppColors.greentit)),
                    verticalSpace(25),
                    SvgPicture.asset(
                      AppAssets.imgSetNewPass,
                      height: 170,
                    ),
                    verticalSpace(25),
                    CustomTextFormField(
                      labelText: 'New Password',
                      hintText: 'Enter your new password',
                      onChanged: (value) {},
                      obscureText: true,
                      textcontroller: cubit.newPasswordController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Password is required';
                        } else if (value.length < 6) {
                          return 'Password must be at least 6 characters';
                        }
                        return null;
                      },
                    ),
                    verticalSpace(15),
                    CustomTextFormField(
                      labelText: 'Confirm Password',
                      hintText: 'Enter your new password again',
                      onChanged: (value) {},
                      obscureText: true,
                      validator: (value) {
                        if (value!.length < 6 || value.isEmpty) {
                          return 'Enter valid Password';
                        } else if (value != cubit.newPasswordController.text) {
                          return 'Must match password';
                        }
                        return null;
                      },
                    ),
                    verticalSpace(20),
                    CustomButton(
                      text: 'Save',
                      textColor: AppColors.basicWhite,
                      color: AppColors.greenButt,
                      onPressed: () {
                        if (formThirdKey.currentState!.validate()) {
                          BlocProvider.of<ForgetPassCubit>(context)
                              .resetPassword();
                        }
                        // navigate(
                        //     context: context, route: Routes.succSetNewPass);
                      },
                    ),
                  ]),
            ),
          ),
        );
      },
    );
  }
}
