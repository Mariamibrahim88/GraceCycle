import 'package:grace_cycle/core/database/remote/end_points.dart';

class LoginModel {
  final String token;
  LoginModel({
    required this.token,
  });
  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      token: json[ApiKeys.token],
    );
  }
}

