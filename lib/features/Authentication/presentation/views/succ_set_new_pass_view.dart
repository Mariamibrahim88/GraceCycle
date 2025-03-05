import 'package:flutter/material.dart';
import 'package:grace_cycle/core/widgets/custom_safe_area.dart';
import 'package:grace_cycle/features/Authentication/presentation/views/widgets/succ_set_new_pass_view_body.dart';

class SuccSetNewPassView extends StatelessWidget {
  const SuccSetNewPassView({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomSafeArea(
      body: SuccSetNewPassViewBody(),
    );
  }
}
