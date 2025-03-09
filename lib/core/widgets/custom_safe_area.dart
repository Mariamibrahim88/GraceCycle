import 'package:flutter/material.dart';
import 'package:grace_cycle/core/utils/app_colors.dart';

class CustomSafeArea extends StatelessWidget {
  const CustomSafeArea({
    super.key,
    required this.body,
  });
  final Widget body;
  @override
  // Widget build(BuildContext context) {
  //   return Container(
  //     color: AppColors.basicWhite,
  //     padding: const EdgeInsets.only(top: 45.0, left: 2.0),
  //     child: Scaffold(
  //       appBar: CustomAppBar(
  //         onPressed: () {
  //           Navigator.pop(context);
  //         },
  //       ),
  //       backgroundColor: AppColors.basicWhite,
  //       body: body,
  //     ),
  //   );
  // }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.basicWhite,
      body: body,
    );
  }
}
