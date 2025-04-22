import 'package:flutter/material.dart';
import 'package:grace_cycle/core/widgets/custom_safe_area.dart';
import 'package:grace_cycle/features/details/presentation/views/widgets/food_details_body.dart';

class FoodDetails extends StatelessWidget {
  const FoodDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomSafeArea(body: FoodDetailsBody());
  }
}
