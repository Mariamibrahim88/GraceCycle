import 'package:grace_cycle/features/details/data/models/review_summary_model.dart';
import 'package:grace_cycle/features/details/data/models/similar_item_model.dart';

class FoodItemDetailsModel {
  final List<String> categories;
  final String vendorId;
  final String vendorOpeningTime;
  final String vendorClosingTime;
  final String description;
  final List<SimilarItemModel> similarItems;
  final ReviewSummaryModel reviewsSummary;
  final List<Review> reviews;
  //final String originalPriceFormatted;
  //final int quantityAvailableDisplay;
  //final String operatingHours;
  final int id;
  final String name;
  final String picUrl;
  final double rating;
  final bool isFavourite;
  final int quantity;
  final double unitPrice;
  final double newPrice;
  final int discountPercentage;
  final String vName;

  FoodItemDetailsModel({
    required this.categories,
    required this.vendorId,
    required this.vendorOpeningTime,
    required this.vendorClosingTime,
    required this.description,
    required this.similarItems,
    required this.reviewsSummary,
    required this.reviews,
    //required this.originalPriceFormatted,
    //required this.discountedPriceFormatted,
    //required this.quantityAvailableDisplay,
    //required this.operatingHours,
    required this.id,
    required this.name,
    required this.picUrl,
    required this.rating,
    required this.isFavourite,
    required this.quantity,
    required this.unitPrice,
    required this.newPrice,
    required this.discountPercentage,
    required this.vName,
  });

  factory FoodItemDetailsModel.fromJson(Map<String, dynamic> json) {
    return FoodItemDetailsModel(
      categories: List<String>.from(json['categories']),
      vendorId: json['vendorId'],
      vendorOpeningTime: json['vendorOpeningTime'],
      vendorClosingTime: json['vendorClosingTime'],
      description: json['description'],
      similarItems: List<SimilarItemModel>.from(
          json['similarItems'].map((x) => SimilarItemModel.fromJson(x))),
      reviewsSummary: ReviewSummaryModel.fromJson(json['reviewsSummary']),
      reviews:
          List<Review>.from(json['reviews'].map((x) => Review.fromJson(x))),
      //originalPriceFormatted: json['originalPriceFormatted'],
      //discountedPriceFormatted: json['discountedPriceFormatted'],
      //quantityAvailableDisplay: json['quantity'],
      //operatingHours: json['operatingHours'],
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
    );
  }
}
