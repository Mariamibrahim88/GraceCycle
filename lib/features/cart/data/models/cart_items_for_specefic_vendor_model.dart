class CartItemsForSpecificVendorModel {
  final String vendorId;
  final String vendorName;
  final List<CartItem> items;
  final double total;
  final int count;

  CartItemsForSpecificVendorModel({
    required this.vendorId,
    required this.vendorName,
    required this.items,
    required this.total,
    required this.count,
  });

  factory CartItemsForSpecificVendorModel.fromJson(Map<String, dynamic> json) {
    return CartItemsForSpecificVendorModel(
      vendorId: json['vendorId'],
      vendorName: json['vendorName'],
      items: (json['items'] as List)
          .map((item) => CartItem.fromJson(item))
          .toList(),
      total: (json['total'] as num).toDouble(),
      count: json['count'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'vendorId': vendorId,
      'vendorName': vendorName,
      'items': items.map((item) => item.toJson()).toList(),
      'total': total,
      'count': count,
    };
  }
}

class CartItem {
  final int available;
  final int id;
  final String name;
  final String picUrl;
  final double unitPrice;
  final double newPrice;
  int quantity;

  CartItem({
    required this.available,
    required this.id,
    required this.name,
    required this.picUrl,
    required this.unitPrice,
    required this.newPrice,
    required this.quantity,
  });

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      available: json['available'],
      id: json['id'],
      name: json['name'],
      picUrl: json['picUrl'],
      unitPrice: (json['unitPrice'] as num).toDouble(),
      newPrice: (json['newPrice'] as num).toDouble(),
      quantity: json['quantity'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'available': available,
      'id': id,
      'name': name,
      'picUrl': picUrl,
      'unitPrice': unitPrice,
      'newPrice': newPrice,
      'quantity': quantity,
    };
  }
}
