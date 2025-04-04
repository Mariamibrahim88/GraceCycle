class FoodMenuModel {
  Map<String, List<FoodItemModel>> categories;

  FoodMenuModel({required this.categories});

  factory FoodMenuModel.fromJson(Map<String, dynamic> json) {
    Map<String, List<FoodItemModel>> categories = {};

    json.forEach((key, value) {
      categories[key] =
          (value as List).map((item) => FoodItemModel.fromJson(item)).toList();
    });

    return FoodMenuModel(categories: categories);
  }
}

class FoodItemModel {
  final int id;
  final int quantity;
  final double unitPrice;
  final double newPrice;
  final int discountPercentage;
  final String vName;
  final String vOpening;
  final String vClosing;
  final String name;
  final String picUrl;
  final double rating;
  final bool isFavourite;

  FoodItemModel(
      {required this.id,
      required this.quantity,
      required this.unitPrice,
      required this.newPrice,
      required this.discountPercentage,
      required this.vName,
      required this.vOpening,
      required this.vClosing,
      required this.name,
      required this.picUrl,
      required this.rating,
      required this.isFavourite});

  factory FoodItemModel.fromJson(Map<String, dynamic> json) {
    return FoodItemModel(
      id: json['id'],
      quantity: json['quantity'],
      unitPrice: json['unitPrice'],
      newPrice: json['newPrice'],
      discountPercentage: json['discountPercentage'],
      vName: json['vName'],
      vOpening: json['vOpening'],
      vClosing: json['vClosing'],
      name: json['name'],
      picUrl: json['picUrl'],
      rating: json['rating'],
      isFavourite: json['isFavourite'],
    );
  }
}
