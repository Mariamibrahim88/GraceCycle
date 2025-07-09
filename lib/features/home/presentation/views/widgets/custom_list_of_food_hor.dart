import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grace_cycle/core/routes/app_routes.dart';
import 'package:grace_cycle/features/home/data/models/food_menu_model.dart';
import 'package:grace_cycle/features/home/presentation/manager/Home_cubit/home_cubit.dart';
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
                          child: GestureDetector(
                            onTap: () async {
                              final shouldRefresh = await Navigator.pushNamed(
                                context,
                                Routes.foodDetails,
                                arguments: foodItemModel[index].id,
                              );
                              if (shouldRefresh == true) {
                                context.read<HomeCubit>().getFoodMenu();
                              }
                              // final shouldRefresh = await Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //       builder: (_) => const FoodDetailsView()),
                              // );

                              // if (shouldRefresh == true) {
                              //   // Call your refresh method here, e.g.:
                              //   context.read<HomeCubit>().getFoodMenu();
                              // }

                              // navigate(
                              //     context: context,
                              //     route: Routes.foodDetails,
                              //     arg: foodItemModel[index].id);
                            },
                            child: FoodCard(
                              foodItemModel: foodItemModel[index],
                            ),
                          ),
                        );
                      }),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
