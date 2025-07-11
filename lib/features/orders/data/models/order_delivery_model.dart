class OrderDeliveryModel {
  final int deliveryMethodId;
  String? address;
  final double deliveryFee;
  final double subTotal;
  final double total;

  OrderDeliveryModel({
    required this.deliveryMethodId,
    this.address,
    required this.deliveryFee,
    required this.subTotal,
    required this.total,
  });

  factory OrderDeliveryModel.fromJson(Map<String, dynamic> json) {
    return OrderDeliveryModel(
      deliveryMethodId: json['deliveryMethodId'],
      address: json['address'],
      deliveryFee: (json['deliveryFee'] as num).toDouble(),
      subTotal: (json['subTotal'] as num).toDouble(),
      total: (json['total'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'deliveryMethodId': deliveryMethodId,
      'address': address,
      'deliveryFee': deliveryFee,
      'subTotal': subTotal,
      'total': total,
    };
  }
}
