import 'package:grace_cycle/features/home/data/models/food_menu_model.dart';

class DiscoverFoodModel {
  final int count;
  final int pageIndex;
  final int pageSize;
  final List<FoodItemModel> data;

  DiscoverFoodModel(
      {required this.count,
      required this.pageIndex,
      required this.pageSize,
      required this.data});

  factory DiscoverFoodModel.fromJson(Map<String, dynamic> json) {
    return DiscoverFoodModel(
      count: json['count'] as int,
      pageIndex: json['pageIndex'] as int,
      pageSize: json['pageSize'] as int,
      data:
          (json['data'] as List).map((e) => FoodItemModel.fromJson(e)).toList(),
    );
  }
}
