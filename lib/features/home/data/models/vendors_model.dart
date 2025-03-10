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
  final String id;
  final String address;
  final String userName;
  final String logoUrl;
  final String opening;
  final String closing;
  final String picUrl;
  final double rating;
  final bool isFavourite;

  VendorItemModel(
      {required this.id,
      required this.address,
      required this.userName,
      required this.logoUrl,
      required this.opening,
      required this.closing,
      required this.picUrl,
      required this.rating,
      required this.isFavourite});
  
  factory VendorItemModel.fromJson(Map<String, dynamic> json) {
    return VendorItemModel(
      id: json['id'],
      address: json['address'],
      userName: json['userName'],
      logoUrl: json['logoUrl'],
      opening: json['opening'],
      closing: json['closing'],
      picUrl: json['picUrl'],
      rating: json['rating'],
      isFavourite: json['isFavourite'],
    );
  }
}
