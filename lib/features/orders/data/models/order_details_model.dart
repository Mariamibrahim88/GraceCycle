class OrderDetailsModel {
  final int id;
  final List<OrderItem> items;
  final double total;
  final String vendorName;
  final double totalSavings;
  final PaymentSummary paymentSummary;
  final int totalItems;

  OrderDetailsModel({
    required this.id,
    required this.items,
    required this.total,
    required this.vendorName,
    required this.totalSavings,
    required this.paymentSummary,
    required this.totalItems,
  });

  factory OrderDetailsModel.fromJson(Map<String, dynamic> json) {
    return OrderDetailsModel(
      id: json['id'],
      items: (json['items'] as List)
          .map((item) => OrderItem.fromJson(item))
          .toList(),
      total: json['total'],
      vendorName: json['vendorName'],
      totalSavings: json['totalSavings'],
      paymentSummary: PaymentSummary.fromJson(json['paymentSummary']),
      totalItems: json['totalItems'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'items': items.map((item) => item.toJson()).toList(),
      'total': total,
      'vendorName': vendorName,
      'totalSavings': totalSavings,
      'paymentSummary': paymentSummary.toJson(),
    };
  }
}

class OrderItem {
  final int productId;
  final String productName;
  final String picUrl;
  final double price;
  final double originalPrice;
  final int quantity;
 // final int stockLeft;
  final double total;

  OrderItem({
    required this.productId,
    required this.productName,
    required this.picUrl,
    required this.price,
    required this.originalPrice,
    required this.quantity,
    //required this.stockLeft,
    required this.total,
  });

  factory OrderItem.fromJson(Map<String, dynamic> json) {
    return OrderItem(
      productId: json['productId'],
      productName: json['productName'],
      picUrl: json['picUrl'],
      price: (json['price'] as num).toDouble(),
      originalPrice: (json['originalPrice'] as num).toDouble(),
      quantity: json['quantity'],
      //stockLeft: json['stockLeft'],
      total: (json['total'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'productId': productId,
      'productName': productName,
      'picUrl': picUrl,
      'price': price,
      'originalPrice': originalPrice,
      'quantity': quantity,
     // 'stockLeft': stockLeft,
      'total': total,
    };
  }
}

class PaymentSummary {
  final List<PaymentItem> items;

  PaymentSummary({required this.items});

  factory PaymentSummary.fromJson(Map<String, dynamic> json) {
    return PaymentSummary(
      items: (json['items'] as List)
          .map((item) => PaymentItem.fromJson(item))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'items': items.map((item) => item.toJson()).toList(),
    };
  }
}

class PaymentItem {
  final String productName;
  final int quantity;
  final double total;

  PaymentItem({
    required this.productName,
    required this.quantity,
    required this.total,
  });

  factory PaymentItem.fromJson(Map<String, dynamic> json) {
    return PaymentItem(
      productName: json['productName'],
      quantity: json['quantity'],
      total: (json['total'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'productName': productName,
      'quantity': quantity,
      'total': total,
    };
  }
}
