import 'package:grace_cycle/features/home/data/models/food_menu_model.dart';

class SimilarItemModel extends FoodItemModel {
  SimilarItemModel({
    required int id,
    required int quantity,
    required double unitPrice,
    required double newPrice,
    required int discountPercentage,
    required String vendorName,
    required String vendorOpeningTime,
    required String vendorClosingTime,
    required String name,
    required String picUrl,
    required double rating,
    required bool isFavourite,
  }) : super(
          id: id,
          quantity: quantity,
          unitPrice: unitPrice,
          newPrice: newPrice,
          discountPercentage: discountPercentage,
          vName: vendorName,
          vOpening: vendorOpeningTime,
          vClosing: vendorClosingTime,
          name: name,
          picUrl: picUrl,
          rating: rating,
          isFavourite: isFavourite,
        );

  factory SimilarItemModel.fromJson(Map<String, dynamic> json) {
    return SimilarItemModel(
      id: json['id'],
      name: json['name'],
      picUrl: json['picUrl'],
      rating: (json['rating'] as num).toDouble(),
      isFavourite: json['isFavourite'],
      quantity: json['quantity'],
      unitPrice: (json['unitPrice'] as num).toDouble(),
      newPrice: (json['newPrice'] as num).toDouble(),
      discountPercentage: json['discountPercentage'],
      vendorName: json['vName'],
      vendorOpeningTime: json['vOpening'],
      vendorClosingTime: json['vClosing'],
    );
  }
}
