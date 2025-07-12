class UpdateOrderDeliveryModel {
  final int deliveryMethodId;
  final String address;
  final double deliveryFee;
  final double subTotal;
  final double total;

  UpdateOrderDeliveryModel(
      {required this.deliveryMethodId,
      required this.address,
      required this.deliveryFee,
      required this.subTotal,
      required this.total});

  factory UpdateOrderDeliveryModel.fromJson(Map<String, dynamic> json) {
    return UpdateOrderDeliveryModel(
      deliveryMethodId: json['deliveryMethodId'] ?? 0,
      address: json['address'] ?? '',
      deliveryFee: json['deliveryFee'] ?? 0,
      subTotal: json['subTotal'] ?? 0,
      total: json['total'] ?? 0,
    );
  }
}
