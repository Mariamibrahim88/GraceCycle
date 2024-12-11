import 'package:flutter/material.dart';
import 'package:grace_cycle/core/utils/app_colors.dart';
import 'package:grace_cycle/features/Authentication/presentation/views/widgets/signup_continue_body.dart';

class SignupContinueView extends StatelessWidget {
  const SignupContinueView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: Scaffold(
      backgroundColor: AppColors.basicWhite,
      body: SignupContinueBody(),
    ));
  }
}
