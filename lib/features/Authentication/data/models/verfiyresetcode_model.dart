import 'package:grace_cycle/core/database/remote/end_points.dart';

class VerfiyResetcodeModel {
  final String token;
  VerfiyResetcodeModel({
    required this.token,
  });
  factory VerfiyResetcodeModel.fromJson(Map<String, dynamic> json) {
    return VerfiyResetcodeModel(
      token: json[ApiKeys.token],
    );
  }
}
