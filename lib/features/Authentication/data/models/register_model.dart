import 'package:grace_cycle/core/database/remote/end_points.dart';

class RegisterModel {
  final String message;
  final String token;

  RegisterModel({required this.message, required this.token});

  factory RegisterModel.fromJson(Map<String, dynamic> jsonData) {
    return RegisterModel(
      message: jsonData[ApiKeys.message],
      token: jsonData[ApiKeys.token],
    );
  }
}
