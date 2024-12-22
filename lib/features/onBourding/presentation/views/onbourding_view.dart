import 'package:flutter/material.dart';
import 'package:grace_cycle/core/utils/app_colors.dart';
import 'package:grace_cycle/core/widgets/custom_app_bar.dart';
import 'package:grace_cycle/features/onBourding/presentation/views/components/onbourding_body.dart';

class OnBourdingView extends StatelessWidget {
  const OnBourdingView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            // appBar: CustomAppBar(
            //   padding: const EdgeInsets.all(0),
            //   onPressed: () {
            //     Navigator.pop(context);
            //   },
            // ),
            backgroundColor: AppColors.basicWhite,
            body: const OnbourdingBody()));
  }
}
