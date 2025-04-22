// class FavVendorModel {
//   final String userId;
//   final String address;
//   final String displayName;
//   final String logoUrl;
//   final String picUrl;
//   final double rating;
//   final bool isFavourite;
//   final int items;

//   FavVendorModel({
//     required this.userId,
//     required this.address,
//     required this.displayName,
//     required this.logoUrl,
//     required this.picUrl,
//     required this.rating,
//     required this.isFavourite,
//     required this.items,
//   });

//   factory FavVendorModel.fromJson(Map<String, dynamic> json) {
//     return FavVendorModel(
//       userId: json['userId'],
//       address: json['address'],
//       displayName: json['displayName'],
//       logoUrl: json['logoUrl'],
//       picUrl: json['picUrl'],
//       rating: (json['rating'] as num).toDouble(),
//       isFavourite: json['isFavourite'],
//       items: json['items'],
//     );
//   }
// }
class VendorFavResponse {
  final int count;
  final int pageIndex;
  final int pageSize;
  final List<FavVendorItem> data;

  VendorFavResponse({
    required this.count,
    required this.pageIndex,
    required this.pageSize,
    required this.data,
  });

  factory VendorFavResponse.fromJson(Map<String, dynamic> json) {
    return VendorFavResponse(
      count: json['count'],
      pageIndex: json['pageIndex'],
      pageSize: json['pageSize'],
      data: List<FavVendorItem>.from(json['data'].map((x) => FavVendorItem.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'count': count,
      'pageIndex': pageIndex,
      'pageSize': pageSize,
      'data': List<dynamic>.from(data.map((x) => x.toJson())),
    };
  }
}

class FavVendorItem {
  final String userId;
  final String address;
  final String displayName;
  final String logoUrl;
  final String picUrl;
  final double rating;
  final bool isFavourite;
  final int items;

  FavVendorItem({
    required this.userId,
    required this.address,
    required this.displayName,
    required this.logoUrl,
    required this.picUrl,
    required this.rating,
    required this.isFavourite,
    required this.items,
  });

  factory FavVendorItem.fromJson(Map<String, dynamic> json) {
    return FavVendorItem(
      userId: json['userId'],
      address: json['address'],
      displayName: json['displayName'],
      logoUrl: json['logoUrl'],
      picUrl: json['picUrl'],
      rating: (json['rating'] as num).toDouble(),
      isFavourite: json['isFavourite'],
      items: json['items'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'address': address,
      'displayName': displayName,
      'logoUrl': logoUrl,
      'picUrl': picUrl,
      'rating': rating,
      'isFavourite': isFavourite,
      'items': items,
    };
  }
}
