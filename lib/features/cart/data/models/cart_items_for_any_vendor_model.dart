class CartItemsForAnyVendorModel {
  final String vendorId;
  final String vendorName;
  final DateTime createdAt;
  final int total;
  final int count;

  CartItemsForAnyVendorModel({
    required this.vendorId,
    required this.vendorName,
    required this.createdAt,
    required this.total,
    required this.count,
  });

  factory CartItemsForAnyVendorModel.fromJson(Map<String, dynamic> json) {
    return CartItemsForAnyVendorModel(
      vendorId: json['vendorId'],
      vendorName: json['vendorName'],
      createdAt: DateTime.parse(json['createdAt']),
      total: json['total'],
      count: json['count'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'vendorId': vendorId,
      'vendorName': vendorName,
      'createdAt': createdAt.toIso8601String(),
      'total': total,
      'count': count,
    };
  }
}
