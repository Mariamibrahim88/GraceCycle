import 'package:grace_cycle/core/database/remote/end_points.dart';

class ForgetpassModel {
  final String message;


  ForgetpassModel({
    required this.message,
  });
  factory ForgetpassModel.fromJson(Map<String, dynamic> json) {
    return ForgetpassModel(
      message: json[ApiKeys.message],
    );
  }
  
}