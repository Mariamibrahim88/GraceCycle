import 'package:flutter/material.dart';
import 'package:grace_cycle/core/utils/app_colors.dart';
import 'package:grace_cycle/core/widgets/custom_app_bar.dart';
import 'package:grace_cycle/features/Authentication/presentation/views/widgets/verify_your_email_view_body.dart';

class VerifyYourEmailView extends StatelessWidget {
  const VerifyYourEmailView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(onPressed: () {
          Navigator.pop(context);
        }),
        body: VerifyYourEmailViewBody(),
        backgroundColor: AppColors.basicWhite,
      ),
    );
  }
}
