class CartItem {
  final int productId;
  final String productName;
  final String picUrl;
  final double price;
  final double originalPrice;
  final int quantity;
  //final int stockLeft;
  final double total;

  CartItem({
    required this.productId,
    required this.productName,
    required this.picUrl,
    required this.price,
    required this.originalPrice,
    required this.quantity,
   // required this.stockLeft,
    required this.total,
  });

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      productId: json['productId'],
      productName: json['productName'],
      picUrl: json['picUrl'].replaceFirst('/', ''),
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
      //'stockLeft': stockLeft,
      'total': total,
    };
  }
}

class PaymentSummaryItem {
  final String productName;
  final int quantity;
  final double total;

  PaymentSummaryItem({
    required this.productName,
    required this.quantity,
    required this.total,
  });

  factory PaymentSummaryItem.fromJson(Map<String, dynamic> json) {
    return PaymentSummaryItem(
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

class OrderModel {
  final int id;
  final List<CartItem> items;
  final double total;
  final String vendorName;
  final double totalSavings;
  final List<PaymentSummaryItem> paymentSummary;

  OrderModel({
    required this.id,
    required this.items,
    required this.total,
    required this.vendorName,
    required this.totalSavings,
    required this.paymentSummary,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      id: json['id'],
      items: (json['items'] as List)
          .map((item) => CartItem.fromJson(item))
          .toList(),
      total: (json['total'] as num).toDouble(),
      vendorName: json['vendorName'],
      totalSavings: (json['totalSavings'] as num).toDouble(),
      paymentSummary: (json['paymentSummary']['items'] as List)
          .map((item) => PaymentSummaryItem.fromJson(item))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'items': items.map((item) => item.toJson()).toList(),
      'total': total,
      'vendorName': vendorName,
      'totalSavings': totalSavings,
      'paymentSummary': {
        'items': paymentSummary.map((item) => item.toJson()).toList(),
      },
    };
  }
}
