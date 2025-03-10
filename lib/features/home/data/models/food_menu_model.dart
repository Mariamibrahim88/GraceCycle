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
  final double oldPrice;
  final double priceAfterDisc;
  final int discountPercentage;
  final String vendorId;
  final String vName;
  final String vLogo;
  final String vOpening;
  final String vClosing;
  final String fName;
  final String fImage;
  final double fRating;
  final bool isFavourite;

  FoodItemModel(
      {required this.id,
      required this.quantity,
      required this.oldPrice,
      required this.priceAfterDisc,
      required this.discountPercentage,
      required this.vendorId,
      required this.vName,
      required this.vLogo,
      required this.vOpening,
      required this.vClosing,
      required this.fName,
      required this.fImage,
      required this.fRating,
      required this.isFavourite});

  factory FoodItemModel.fromJson(Map<String, dynamic> json) {
    return FoodItemModel(
      id: json['id'],
      quantity: json['quantity'],
      oldPrice: json['oldPrice'],
      priceAfterDisc: json['price_After_Disc'],
      discountPercentage: json['discountPercentage'],
      vendorId: json['vendorId'],
      vName: json['vName'],
      vLogo: json['vLogo'],
      vOpening: json['vOpening'],
      vClosing: json['vClosing'],
      fName: json['fName'],
      fImage: json['fImage'],
      fRating: json['fRating'],
      isFavourite: json['isFavourite'],
    );
  }
}
