import 'package:flutter/material.dart';
import 'package:grace_cycle/core/utils/app_colors.dart';

class CustomSafeArea extends StatelessWidget {
  const CustomSafeArea({
    super.key,
    required this.body,
  });
  final Widget body;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.basicWhite,
        body: body,
      ),
    );
  }
}
