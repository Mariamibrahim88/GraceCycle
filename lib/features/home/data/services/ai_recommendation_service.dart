import 'package:grace_cycle/features/home/data/models/food_menu_model.dart';
import 'package:grace_cycle/features/home/data/models/recommendation_model.dart';
import 'package:grace_cycle/features/home/data/models/vendors_model.dart';

class AIRecommendationService {
  // خوارزمية AI بسيطة للتوصية
  static List<RecommendationModel> getRecommendations({
    required FoodMenuModel foodMenuModel,
    required VendorsModel vendorsModel,
    List<int>? userFavoriteFoodIds,
    List<String>? userFavoriteCategories,
    List<String>? userFavoriteVendors,
    double? userAveragePricePreference,
  }) {
    List<RecommendationModel> recommendations = [];
    Set<int> addedFoodIds = {}; // لمنع تكرار نفس الأكلة

    // جمع جميع الأطعمة
    List<FoodItemModel> allFoods = [];
    foodMenuModel.categories.forEach((category, foods) {
      allFoods.addAll(foods);
    });

    // حساب نقاط التوصية لكل طعام
    for (var food in allFoods) {
      // التحقق من عدم تكرار الأكلة
      if (addedFoodIds.contains(food.id)) {
        continue; // تخطي هذه الأكلة إذا كانت موجودة مسبقاً
      }

      double score = 0.0;
      String reason = '';

      // 1. نقاط التقييم (40% من النقاط)
      score += (food.rating / 5.0) * 0.4;

      // 2. نقاط المفضلة (20% من النقاط)
      if (food.isFavourite) {
        score += 0.2;
        reason += 'User favorite, ';
      }

      // 3. نقاط الفئة المفضلة (15% من النقاط)
      if (userFavoriteCategories != null) {
        for (var category in foodMenuModel.categories.keys) {
          if (foodMenuModel.categories[category]!.contains(food)) {
            if (userFavoriteCategories.contains(category)) {
              score += 0.15;
              reason += 'Favorite category, ';
              break;
            }
          }
        }
      }

      // 4. نقاط السعر المناسب (15% من النقاط)
      if (userAveragePricePreference != null) {
        double priceDifference =
            (food.newPrice - userAveragePricePreference).abs();
        if (priceDifference <= 10) {
          score += 0.15;
          reason += 'Good price, ';
        }
      }

      // 5. نقاط الخصم (10% من النقاط)
      if (food.discountPercentage > 0) {
        score += 0.1;
        reason += 'On discount, ';
      }

      // إنشاء نموذج التوصية
      if (score > 0.3) {
        // إضافة معرف الأكلة للمجموعة لمنع التكرار
        addedFoodIds.add(food.id);

        // فقط الأطعمة ذات النقاط العالية
        recommendations.add(RecommendationModel(
          foodId: food.id,
          foodName: food.name,
          picUrl: food.picUrl,
          rating: food.rating,
          newPrice: food.newPrice,
          vendorName: food.vName,
          recommendationScore: score,
          reason: reason.isNotEmpty
              ? reason.substring(0, reason.length - 2)
              : 'Highly rated',
        ));
      }
    }

    // ترتيب التوصيات حسب النقاط
    recommendations
        .sort((a, b) => b.recommendationScore.compareTo(a.recommendationScore));

    // إرجاع أفضل 8 توصيات
    return recommendations.take(8).toList();
  }

  // خوارزمية التوصية المتقدمة (Collaborative Filtering بسيط)
  static List<RecommendationModel> getAdvancedRecommendations({
    required FoodMenuModel foodMenuModel,
    required List<int> userOrderHistory,
    required Map<int, double> foodRatings,
  }) {
    List<RecommendationModel> recommendations = [];
    Set<int> addedFoodIds = {}; // لمنع تكرار نفس الأكلة

    // حساب متوسط تقييم كل طعام
    Map<int, double> averageRatings = {};
    Map<int, int> ratingCounts = {};

    for (var rating in foodRatings.entries) {
      int foodId = rating.key;
      double ratingValue = rating.value;

      if (averageRatings.containsKey(foodId)) {
        averageRatings[foodId] = (averageRatings[foodId]! + ratingValue) / 2;
        ratingCounts[foodId] = (ratingCounts[foodId] ?? 0) + 1;
      } else {
        averageRatings[foodId] = ratingValue;
        ratingCounts[foodId] = 1;
      }
    }

    // جمع جميع الأطعمة
    List<FoodItemModel> allFoods = [];
    foodMenuModel.categories.forEach((category, foods) {
      allFoods.addAll(foods);
    });

    // حساب نقاط التوصية المتقدمة
    for (var food in allFoods) {
      // التحقق من عدم تكرار الأكلة
      if (addedFoodIds.contains(food.id)) {
        continue; // تخطي هذه الأكلة إذا كانت موجودة مسبقاً
      }

      double score = 0.0;
      String reason = '';

      // 1. تقييم المستخدمين الآخرين
      if (averageRatings.containsKey(food.id)) {
        score += (averageRatings[food.id]! / 5.0) * 0.3;
        reason += 'Popular among users, ';
      }

      // 2. عدد التقييمات (الأطعمة الشائعة)
      if (ratingCounts.containsKey(food.id) && ratingCounts[food.id]! > 5) {
        score += 0.2;
        reason += 'Many reviews, ';
      }

      // 3. التقييم العالي
      if (food.rating >= 4.0) {
        score += 0.25;
        reason += 'High rating, ';
      }

      // 4. المفضلة
      if (food.isFavourite) {
        score += 0.15;
        reason += 'User favorite, ';
      }

      // 5. الخصم
      if (food.discountPercentage > 0) {
        score += 0.1;
        reason += 'On sale, ';
      }

      if (score > 0.4) {
        // إضافة معرف الأكلة للمجموعة لمنع التكرار
        addedFoodIds.add(food.id);

        recommendations.add(RecommendationModel(
          foodId: food.id,
          foodName: food.name,
          picUrl: food.picUrl,
          rating: food.rating,
          newPrice: food.newPrice,
          vendorName: food.vName,
          recommendationScore: score,
          reason: reason.isNotEmpty
              ? reason.substring(0, reason.length - 2)
              : 'Recommended',
        ));
      }
    }

    recommendations
        .sort((a, b) => b.recommendationScore.compareTo(a.recommendationScore));
    return recommendations.take(6).toList();
  }
}
