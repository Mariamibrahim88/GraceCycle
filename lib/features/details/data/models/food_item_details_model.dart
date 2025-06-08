import 'package:grace_cycle/features/details/data/models/review_summary_model.dart';
import 'package:grace_cycle/features/details/data/models/similar_item_model.dart';

class FoodItemDetailsModel {
  final int id;
  final String name;
  final String description;
  final String picUrl;
  final double rating;
  final bool isFavourite;
  final int quantity;
  final double unitPrice;
  final double newPrice;
  final int discountPercentage;
  final String vendorName;
  final String vendorOpeningTime;
  final String vendorClosingTime;
  final String operatingHours;
  final String originalPriceFormatted;
  final String discountedPriceFormatted;
  final String quantityAvailableDisplay;
  final List<String> categories;
  final List<SimilarItemModel> similarItems;
  final ReviewSummaryModel reviewsSummary;
  final List<Review> reviews;

  FoodItemDetailsModel({
    required this.id,
    required this.name,
    required this.description,
    required this.picUrl,
    required this.rating,
    required this.isFavourite,
    required this.quantity,
    required this.unitPrice,
    required this.newPrice,
    required this.discountPercentage,
    required this.vendorName,
    required this.vendorOpeningTime,
    required this.vendorClosingTime,
    required this.operatingHours,
    required this.originalPriceFormatted,
    required this.discountedPriceFormatted,
    required this.quantityAvailableDisplay,
    required this.categories,
    required this.similarItems,
    required this.reviewsSummary,
    required this.reviews,
  });

  factory FoodItemDetailsModel.fromJson(Map<String, dynamic> json) {
    return FoodItemDetailsModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      picUrl: json['picUrl'],
      rating: (json['rating'] as num).toDouble(),
      isFavourite: json['isFavourite'],
      quantity: json['quantity'],
      unitPrice: (json['unitPrice'] as num).toDouble(),
      newPrice: (json['newPrice'] as num).toDouble(),
      discountPercentage: json['discountPercentage'],
      vendorName: json['vName'],
      vendorOpeningTime: json['vendorOpeningTime'],
      vendorClosingTime: json['vendorClosingTime'],
      operatingHours: json['operatingHours'],
      originalPriceFormatted: json['originalPriceFormatted'],
      discountedPriceFormatted: json['discountedPriceFormatted'],
      quantityAvailableDisplay: json['quantityAvailableDisplay'],
      categories: List<String>.from(json['categories']),
      similarItems: (json['similarItems'] as List)
          .map((e) => SimilarItemModel.fromJson(e))
          .toList(),
      reviewsSummary: ReviewSummaryModel.fromJson(json['reviewsSummary']),
      reviews:
          (json['reviews'] as List).map((e) => Review.fromJson(e)).toList(),
    );
  }
}
