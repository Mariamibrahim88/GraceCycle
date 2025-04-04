class FavVendorModel {
  final String userId;
  final String address;
  final String displayName;
  final String logoUrl;
  final String picUrl;
  final double rating;
  final bool isFavourite;
  final int items;

  FavVendorModel({
    required this.userId,
    required this.address,
    required this.displayName,
    required this.logoUrl,
    required this.picUrl,
    required this.rating,
    required this.isFavourite,
    required this.items,
  });

  factory FavVendorModel.fromJson(Map<String, dynamic> json) {
    return FavVendorModel(
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
}
