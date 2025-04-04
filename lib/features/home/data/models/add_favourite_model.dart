class AddFavouriteModel {
  final int statusCode;
  final String message;

  AddFavouriteModel({required this.statusCode, required this.message});

  factory AddFavouriteModel.fromJson(Map<String, dynamic> json) {
    return AddFavouriteModel(
      statusCode: json['statusCode'],
      message: json['message'],
    );
  }
}
