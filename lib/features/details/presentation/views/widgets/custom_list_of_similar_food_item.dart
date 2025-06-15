import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grace_cycle/core/routes/app_routes.dart';
import 'package:grace_cycle/core/utils/app_navigate.dart';
import 'package:grace_cycle/features/details/data/models/food_item_details_model.dart';
import 'package:grace_cycle/features/home/presentation/views/widgets/food_card.dart';

class CustomListOfSimilarFoodItem extends StatelessWidget {
  const CustomListOfSimilarFoodItem(
      {super.key, required this.foodItemDetailsModel});

  final FoodItemDetailsModel foodItemDetailsModel;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300.h,
      child: ListView.builder(
          itemCount: foodItemDetailsModel.similarItems.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(left: 8.w),
              child: GestureDetector(
                onTap: () {
                  navigate(
                      context: context,
                      route: Routes.foodDetails,
                      arg: foodItemDetailsModel.similarItems[index].id);
                },
                child: FoodCard(
                  foodItemModel: foodItemDetailsModel.similarItems[index],
                ),
              ),
            );
          }),
    );
  }
}
