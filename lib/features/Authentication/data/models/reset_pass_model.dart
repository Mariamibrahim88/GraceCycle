class ResetPassModel {
  final String message;

  ResetPassModel({required this.message});

  factory ResetPassModel.fromJson(Map<String, dynamic> json) {
    return ResetPassModel(
      message: json['message'],
    );
  }
}
