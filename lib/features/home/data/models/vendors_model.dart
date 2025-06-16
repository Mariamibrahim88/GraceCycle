class VendorsModel {
  Map<String, List<VendorItemModel>> vendors;
  VendorsModel({required this.vendors});

  factory VendorsModel.fromJson(Map<String, dynamic> json) {
    Map<String, List<VendorItemModel>> vendors = {};

    json.forEach((key, value) {
      vendors[key] =
          (value as List).map((item) => VendorItemModel.fromJson(item)).toList();
    });

    return VendorsModel(
      vendors: vendors,
    );
  }
}

class VendorItemModel {
  final String userId;
  final String address;
  final String displayName;
  final String logoUrl;
  final String opening;
  final String closing;
  final String picUrl;
  final double rating;
  final bool isFavourite;

  VendorItemModel(
      {required this.userId,
      required this.address,
      required this.displayName,
      required this.logoUrl,
      required this.opening,
      required this.closing,
      required this.picUrl,
      required this.rating,
      required this.isFavourite});
  
  factory VendorItemModel.fromJson(Map<String, dynamic> json) {
    return VendorItemModel(
      userId: json['userId'],
      address: json['address'],
      displayName: json['displayName'],
      logoUrl: json['logoUrl'],
      opening: json['opening'],
      closing: json['closing'],
      picUrl: json['picUrl'],
      rating: json['rating'],
      isFavourite: json['isFavourite'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'address': address,
      'displayName': displayName,
      'logoUrl': logoUrl,
      'opening': opening,
      'closing': closing,
      'picUrl': picUrl,
      'rating': rating,
      'isFavourite': isFavourite,
    };
  }
}
