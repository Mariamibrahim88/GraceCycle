import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grace_cycle/core/routes/app_routes.dart';
import 'package:grace_cycle/features/home/presentation/manager/Home_cubit/home_cubit.dart';
import 'package:grace_cycle/features/home/presentation/manager/Home_cubit/home_state.dart';
import 'package:grace_cycle/features/home/presentation/views/widgets/food_card.dart';
import 'package:grace_cycle/features/home/data/models/food_menu_model.dart';
import 'package:grace_cycle/features/home/presentation/views/widgets/header_of_category.dart';
import 'package:grace_cycle/features/home/data/services/ai_recommendation_service.dart';
import 'package:grace_cycle/features/home/data/models/vendors_model.dart';

class RecommendedFoodsSection extends StatelessWidget {
  const RecommendedFoodsSection({super.key});

  List<FoodItemModel> _getRecommendedFoods(FoodMenuModel foodMenuModel) {
    // استخدام خدمة AI المحسنة للتوصية
    final recommendations = AIRecommendationService.getRecommendations(
      foodMenuModel: foodMenuModel,
      vendorsModel:
          VendorsModel(vendors: {}), // سيتم تجاهله في الخوارزمية الحالية
      userFavoriteFoodIds: null,
      userFavoriteCategories: null,
      userFavoriteVendors: null,
      userAveragePricePreference: null,
    );

    // تحويل التوصيات إلى FoodItemModel
    List<FoodItemModel> recommendedFoods = [];
    Set<int> addedFoodIds = {}; // لمنع التكرار

    for (var recommendation in recommendations) {
      // البحث عن الطعام في النموذج الأصلي
      for (var category in foodMenuModel.categories.values) {
        for (var food in category) {
          if (food.id == recommendation.foodId &&
              !addedFoodIds.contains(food.id)) {
            recommendedFoods.add(food);
            addedFoodIds.add(food.id);
            break;
          }
        }
      }
    }

    return recommendedFoods;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
          current is HomeSuccess ||
          current is HomeUpdateFavorites ||
          current is HomeLoading ||
          current is HomeAddToFavoriteSuccess ||
          current is HomeRemoveFromFavoriteSuccess,
      builder: (context, state) {
        final homeCubit = BlocProvider.of<HomeCubit>(context);
        final foodMenuModel = homeCubit.foodMenuModel;

        if (foodMenuModel == null) {
          return const SizedBox.shrink();
        }

        final recommendedFoods = _getRecommendedFoods(foodMenuModel);

        if (recommendedFoods.isEmpty) {
          return const SizedBox.shrink();
        }

        return Column(
          children: [
            const HeadOfCategory(title: 'Recommended for You'),
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
                          itemCount: recommendedFoods.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.w),
                              child: GestureDetector(
                                onTap: () async {
                                  final shouldRefresh =
                                      await Navigator.pushNamed(
                                    context,
                                    Routes.foodDetails,
                                    arguments: recommendedFoods[index].id,
                                  );
                                  if (shouldRefresh == true) {
                                    context.read<HomeCubit>().getFoodMenu();
                                  }
                                },
                                child: FoodCard(
                                  foodItemModel: recommendedFoods[index],
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
      },
    );
  }
}
