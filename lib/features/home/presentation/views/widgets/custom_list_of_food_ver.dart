import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grace_cycle/features/home/presentation/views/widgets/food_card.dart';

class CustomListOfFoodVer extends StatelessWidget {
  const CustomListOfFoodVer({
    super.key,
    required this.foodTitle,
    required this.foodAsset,
  });

  final String foodTitle;
  final String foodAsset;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20.w,
        ),
        child: Column(
          children: List.generate(
            5,
            (index) => Padding(
              padding: EdgeInsets.symmetric(vertical: 8.w),
              child: FoodCard(
                foodName: foodTitle,
                foodImage: foodAsset,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
