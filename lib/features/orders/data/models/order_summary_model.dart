class OrderSummaryModel {
  final int id;
  final String vendorName;
  final String orderDate;
  final int itemsCount;
  final double total;

  OrderSummaryModel({
    required this.id,
    required this.vendorName,
    required this.orderDate,
    required this.itemsCount,
    required this.total,
  });

  factory OrderSummaryModel.fromJson(Map<String, dynamic> json) {
    return OrderSummaryModel(
      id: json['id'],
      vendorName: json['vendorName'],
      orderDate: json['orderDate'],
      itemsCount: json['itemsCount'],
      total: (json['total'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'vendorName': vendorName,
      'orderDate': orderDate,
      'itemsCount': itemsCount,
      'total': total,
    };
  }
}
