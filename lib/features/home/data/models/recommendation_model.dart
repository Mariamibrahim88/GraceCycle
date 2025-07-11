class RecommendationModel {
  final int foodId;
  final String foodName;
  final String picUrl;
  final double rating;
  final double newPrice;
  final String vendorName;
  final double recommendationScore;
  final String reason;

  RecommendationModel({
    required this.foodId,
    required this.foodName,
    required this.picUrl,
    required this.rating,
    required this.newPrice,
    required this.vendorName,
    required this.recommendationScore,
    required this.reason,
  });

  factory RecommendationModel.fromJson(Map<String, dynamic> json) {
    return RecommendationModel(
      foodId: json['foodId'],
      foodName: json['foodName'],
      picUrl: json['picUrl'],
      rating: (json['rating'] as num).toDouble(),
      newPrice: (json['newPrice'] as num).toDouble(),
      vendorName: json['vendorName'],
      recommendationScore: (json['recommendationScore'] as num).toDouble(),
      reason: json['reason'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'foodId': foodId,
      'foodName': foodName,
      'picUrl': picUrl,
      'rating': rating,
      'newPrice': newPrice,
      'vendorName': vendorName,
      'recommendationScore': recommendationScore,
      'reason': reason,
    };
  }
}

class UserPreferenceModel {
  final List<String> favoriteCategories;
  final List<int> favoriteFoodIds;
  final double averagePricePreference;
  final List<String> favoriteVendors;
  final Map<String, int> categoryVisitCount;

  UserPreferenceModel({
    required this.favoriteCategories,
    required this.favoriteFoodIds,
    required this.averagePricePreference,
    required this.favoriteVendors,
    required this.categoryVisitCount,
  });

  factory UserPreferenceModel.fromJson(Map<String, dynamic> json) {
    return UserPreferenceModel(
      favoriteCategories: List<String>.from(json['favoriteCategories']),
      favoriteFoodIds: List<int>.from(json['favoriteFoodIds']),
      averagePricePreference:
          (json['averagePricePreference'] as num).toDouble(),
      favoriteVendors: List<String>.from(json['favoriteVendors']),
      categoryVisitCount: Map<String, int>.from(json['categoryVisitCount']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'favoriteCategories': favoriteCategories,
      'favoriteFoodIds': favoriteFoodIds,
      'averagePricePreference': averagePricePreference,
      'favoriteVendors': favoriteVendors,
      'categoryVisitCount': categoryVisitCount,
    };
  }
}
