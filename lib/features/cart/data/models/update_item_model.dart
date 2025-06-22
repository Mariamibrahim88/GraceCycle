class UpdateItemModel {
  final String vendorId;
  final String? vendorName;
  final List<CartItemForUpdate> items;
  final double total;
  final int count;

  UpdateItemModel({
    required this.vendorId,
    required this.vendorName,
    required this.items,
    required this.total,
    required this.count,
  });

  factory UpdateItemModel.fromJson(Map<String, dynamic> json) {
    return UpdateItemModel(
      vendorId: json['vendorId'],
      vendorName: json['vendorName'] ?? '',
      items: (json['items'] as List?)?.map((item) {
            return CartItemForUpdate.fromJson(item);
          }).toList() ??
          [],
      total: (json['total'] as num).toDouble(),
      count: json['count'] ?? 0,
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

class CartItemForUpdate {
  final int available;
  final int id;
  final String name;
  final String picUrl;
  final double unitPrice;
  final double newPrice;
  int quantity;

  CartItemForUpdate({
    required this.available,
    required this.id,
    required this.name,
    required this.picUrl,
    required this.unitPrice,
    required this.newPrice,
    required this.quantity,
  });

  factory CartItemForUpdate.fromJson(Map<String, dynamic> json) {
    return CartItemForUpdate(
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
