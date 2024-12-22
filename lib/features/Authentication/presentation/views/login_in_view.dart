import 'package:flutter/material.dart';
import 'package:grace_cycle/core/utils/app_colors.dart';
import 'package:grace_cycle/features/Authentication/presentation/views/widgets/custom_app_bar.dart';
import 'package:grace_cycle/features/Authentication/presentation/views/widgets/login_view_body.dart';

class LoginInView extends StatelessWidget {
  const LoginInView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: CustomAppBar(
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      backgroundColor: AppColors.basicWhite,
      body: const LoginViewBody(),
    ));
  }
}
