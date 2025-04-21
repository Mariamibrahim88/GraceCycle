// class FavFoodModel extends FoodItemModel {
//   FavFoodModel({
//     required int id,
//     required String name,
//     required String picUrl,
//     required double rating,
//     required bool isFavourite,
//     required int quantity,
//     required double unitPrice,
//     required double newPrice,
//     required int discountPercentage,
//     required String vName,
//     String vOpening = '',
//     String vClosing = '',
//   }) : super(
//           id: id,
//           name: name,
//           picUrl: picUrl,
//           rating: rating,
//           isFavourite: isFavourite,
//           quantity: quantity,
//           unitPrice: unitPrice,
//           newPrice: newPrice,
//           discountPercentage: discountPercentage,
//           vName: vName,
//           vOpening: vOpening,
//           vClosing: vClosing,
//         );

//   factory FavFoodModel.fromJson(Map<String, dynamic> json) {
//     return FavFoodModel(
//       id: json['id'],
//       name: json['name'],
//       picUrl: json['picUrl'],
//       rating: (json['rating'] as num).toDouble(),
//       isFavourite: json['isFavourite'],
//       quantity: json['quantity'],
//       unitPrice: (json['unitPrice'] as num).toDouble(),
//       newPrice: (json['newPrice'] as num).toDouble(),
//       discountPercentage: json['discountPercentage'],
//       vName: json['vName'],
//       vOpening: json['vOpening'] ?? '',
//       vClosing: json['vClosing'] ?? '',
//     );
//   }
// }
class FoodFavResponse {
  final int count;
  final int pageIndex;
  final int pageSize;
  final List<FoodItem> data;

  FoodFavResponse({
    required this.count,
    required this.pageIndex,
    required this.pageSize,
    required this.data,
  });

  factory FoodFavResponse.fromJson(Map<String, dynamic> json) {
    return FoodFavResponse(
      count: json['count'],
      pageIndex: json['pageIndex'],
      pageSize: json['pageSize'],
      data: List<FoodItem>.from(
        json['data'].map((item) => FoodItem.fromJson(item)),
      ),
    );
  }
}

class FoodItem {
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

  FoodItem({
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

  factory FoodItem.fromJson(Map<String, dynamic> json) {
    return FoodItem(
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
