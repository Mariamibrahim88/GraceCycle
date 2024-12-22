import 'package:flutter/material.dart';
import 'package:grace_cycle/core/utils/app_colors.dart';
import 'package:grace_cycle/features/onBourding/presentation/views/components/onbourding_body.dart';

class OnBourdingView extends StatelessWidget {
  const OnBourdingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: Scaffold(
            backgroundColor: AppColors.basicWhite, body: OnbourdingBody()));
  }
}
