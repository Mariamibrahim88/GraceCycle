import 'package:flutter/material.dart';
import 'package:grace_cycle/core/utils/app_colors.dart';
import 'package:grace_cycle/core/widgets/custom_app_bar.dart';
import 'package:grace_cycle/features/Authentication/presentation/views/widgets/succ_set_new_pass_view_body.dart';

class SuccSetNewPassView extends StatelessWidget {
  const SuccSetNewPassView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(onPressed: () {
          Navigator.pop(context);
        }),
        backgroundColor: AppColors.basicWhite,
        body: const SuccSetNewPassViewBody(),
      ),
    );
  }
}
