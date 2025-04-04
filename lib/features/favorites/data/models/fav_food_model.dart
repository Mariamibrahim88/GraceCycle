class FavFoodModel {
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

  FavFoodModel({
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
    );
  }
}
