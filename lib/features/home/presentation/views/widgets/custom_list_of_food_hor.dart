import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grace_cycle/features/home/data/models/food_menu_model.dart';
import 'package:grace_cycle/features/home/presentation/views/widgets/food_card.dart';
import 'package:grace_cycle/features/home/presentation/views/widgets/header_of_category.dart';

class CustomListOfFoodHor extends StatelessWidget {
  const CustomListOfFoodHor({
    super.key,
    required this.foodItemModel,
    required this.categoryTitle,
  });

  final List<FoodItemModel> foodItemModel;
  final String categoryTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HeadOfCategory(title: categoryTitle),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20.w,
          ),
          child: Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 293.h,
                  child: ListView.builder(
                      itemCount: foodItemModel.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.w),
                          child: FoodCard(
                            foodItemModel: foodItemModel[index],
                          ),
                        );
                      }),
                ),
              )
            ],
            //   children: List.generate(
            //     foodItemModel.length,
            //     (index) => Padding(
            //       padding: EdgeInsets.symmetric(horizontal: 8.w),
            //       child: FoodCard(
            //         foodItemModel: foodItemModel[index],
            //       ),
            //     ),
            //   ),
            // ),
          ),
        ),
      ],
    );
  }
}
