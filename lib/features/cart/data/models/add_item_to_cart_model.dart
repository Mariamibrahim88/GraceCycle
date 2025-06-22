class AddItemToCartModel {
  final int statusCode;
  final String message;

  AddItemToCartModel({
    required this.statusCode,
    required this.message,
  });

  factory AddItemToCartModel.fromJson(Map<String, dynamic> json) {
    return AddItemToCartModel(
      statusCode: json['statusCode'],
      message: json['message'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'statusCode': statusCode,
      'message': message,
    };
  }
}
