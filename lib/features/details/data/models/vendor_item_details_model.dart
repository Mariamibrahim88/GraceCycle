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
    };
  }

}
