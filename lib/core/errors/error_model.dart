class ErrorModel {
  String errorMessage;
  ErrorModel({required this.errorMessage});
  factory ErrorModel.fromJson(dynamic jsonData) {
    return ErrorModel(
      errorMessage: jsonData != null && jsonData['message'] != null
          ? jsonData['message']
          : 'An error occurred.',
    );
  }
}
