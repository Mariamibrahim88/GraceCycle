import 'package:grace_cycle/features/home/data/models/vendors_model.dart';

class VendorItemDetailsModel {
  final double averageRating;
  final Map<String, int> ratingsCount;
  final String userId;
  final String address;
  final String displayName;
  final String logoUrl;
  final String picUrl;
  final String opening; // Format: HH:mm:ss
  final String closing; // Format: HH:mm:ss
  final double rating;
  final bool isFavourite;
  final List<VendorItemModel> similarItems;
  final List<OfferedItem> itemsOffered;

  VendorItemDetailsModel({
    required this.averageRating,
    required this.ratingsCount,
    required this.userId,
    required this.address,
    required this.displayName,
    required this.logoUrl,
    required this.picUrl,
    required this.opening,
    required this.closing,
    required this.rating,
    required this.isFavourite,
    required this.similarItems,
    required this.itemsOffered,
  });

  factory VendorItemDetailsModel.fromJson(Map<String, dynamic> json) {
    return VendorItemDetailsModel(
      averageRating: (json['averageRating'] ?? 0).toDouble(),
      ratingsCount: Map<String, int>.from(json['ratingsCount'] ?? {}),
      userId: json['userId'] ?? '',
      address: json['address'] ?? '',
      displayName: json['displayName'] ?? '',
      logoUrl: json['logoUrl'] ?? '',
      picUrl: json['picUrl'] ?? '',
      opening: json['opening'] ?? '',
      closing: json['closing'] ?? '',
      rating: (json['rating'] ?? 0).toDouble(),
      isFavourite: json['isFavourite'] ?? false,
      itemsOffered: (json['itemsOffered'] as List<dynamic>?)
          ?.map((item) => OfferedItem.fromJson(item))
          .toList() ??
          [],
      similarItems: (json['similarItems'] as List<dynamic>?)
              ?.map((item) => VendorItemModel.fromJson(item))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'averageRating': averageRating,
      'ratingsCount': ratingsCount,
      'userId': userId,
      'address': address,
      'displayName': displayName,
      'logoUrl': logoUrl,
      'picUrl': picUrl,
      'opening': opening,
      'closing': closing,
      'rating': rating,
      'isFavourite': isFavourite,
      'similarItems': similarItems.map((item) => item.toJson()).toList(),
      'itemsOffered': itemsOffered.map((item) => item.toJson()).toList(),
    };
  }
}

class OfferedItem {
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
  final String vOpening;
  final String vClosing;

  OfferedItem({
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
    required this.vOpening,
    required this.vClosing,
  });

  factory OfferedItem.fromJson(Map<String, dynamic> json) {
    return OfferedItem(
      id: json['id'],
      name: json['name'] ?? '',
      picUrl: json['picUrl'] ?? '',
      rating: (json['rating'] as num).toDouble(),
      isFavourite: json['isFavourite'] ?? false,
      quantity: json['quantity'],
      unitPrice: (json['unitPrice'] as num).toDouble(),
      newPrice: (json['newPrice'] as num).toDouble(),
      discountPercentage: json['discountPercentage'],
      vName: json['vName'] ?? '',
      vOpening: json['vOpening'] ?? '',
      vClosing: json['vClosing'] ?? '',
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'picUrl': picUrl,
      'rating': rating,
      'isFavourite': isFavourite,
      'quantity': quantity,
      'unitPrice': unitPrice,
      'newPrice': newPrice,
      'discountPercentage': discountPercentage,
      'vName': vName,
      'vOpening': vOpening,
      'vClosing': vClosing,
    };
  }
}
