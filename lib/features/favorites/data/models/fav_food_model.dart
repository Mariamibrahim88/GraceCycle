import 'package:grace_cycle/features/home/data/models/food_menu_model.dart';

class FavFoodModel extends FoodItemModel {
  FavFoodModel({
    required int id,
    required String name,
    required String picUrl,
    required double rating,
    required bool isFavourite,
    required int quantity,
    required double unitPrice,
    required double newPrice,
    required int discountPercentage,
    required String vName,
    String vOpening = '',
    String vClosing = '',
  }) : super(
          id: id,
          name: name,
          picUrl: picUrl,
          rating: rating,
          isFavourite: isFavourite,
          quantity: quantity,
          unitPrice: unitPrice,
          newPrice: newPrice,
          discountPercentage: discountPercentage,
          vName: vName,
          vOpening: vOpening,
          vClosing: vClosing,
        );

  factory FavFoodModel.fromJson(Map<String, dynamic> json) {
    return FavFoodModel(
      id: json['id'],
      name: json['name'],
      picUrl: json['picUrl'],
      rating: (json['rating'] as num).toDouble(),
      isFavourite: json['isFavourite'],
      quantity: json['quantity'],
      unitPrice: (json['unitPrice'] as num).toDouble(),
      newPrice: (json['newPrice'] as num).toDouble(),
      discountPercentage: json['discountPercentage'],
      vName: json['vName'],
      vOpening: json['vOpening'] ?? '',
      vClosing: json['vClosing'] ?? '',
    );
  }
}
