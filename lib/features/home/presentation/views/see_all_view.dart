import 'package:flutter/material.dart';
import 'package:grace_cycle/core/widgets/custom_safe_area.dart';
import 'package:grace_cycle/features/home/presentation/views/widgets/see_all_view_body.dart';

class SeeAllView extends StatelessWidget {
  const SeeAllView({super.key});

  @override
  Widget build(BuildContext context) {
        print(ModalRoute.of(context)?.settings.arguments);

    bool isVendor = ModalRoute.of(context)!.settings.arguments as bool;
    return CustomSafeArea(
      body: SeeAllViewBody(
        isVendor: isVendor,
      ),
    );
  }
}
