class PaymentIntentModel {
  final int id;
  final double total;
  final int itemsCount;
  final String paymentIntentId;
  final String clientSecret;

  PaymentIntentModel({
    required this.id,
    required this.total,
    required this.itemsCount,
    required this.paymentIntentId,
    required this.clientSecret,
  });

  factory PaymentIntentModel.fromJson(Map<String, dynamic> json) {
    return PaymentIntentModel(
      id: json['id'],
      total: (json['total'] as num).toDouble(),
      itemsCount: json['itemsCount'],
      paymentIntentId: json['paymentIntentId'],
      clientSecret: json['clitentSecret'], // Note: JSON key is 'clitentSecret'
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'total': total,
      'itemsCount': itemsCount,
      'paymentIntentId': paymentIntentId,
      'clitentSecret': clientSecret,
    };
  }
}
