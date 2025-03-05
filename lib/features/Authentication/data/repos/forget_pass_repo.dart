import 'package:dartz/dartz.dart';
import 'package:grace_cycle/core/database/remote/api_consumer.dart';
import 'package:grace_cycle/core/database/remote/end_points.dart';
import 'package:grace_cycle/core/errors/exceptions.dart';
import 'package:grace_cycle/core/service/service_locator.dart';
import 'package:grace_cycle/features/Authentication/data/models/forgetpass_model.dart';
import 'package:grace_cycle/features/Authentication/data/models/reset_pass_model.dart';
import 'package:grace_cycle/features/Authentication/data/models/verfiyresetcode_model.dart';

class ForgetPassRepo {
  Future<Either<String, ForgetpassModel>> forgetPass(
      {required String email}) async {
    try {
      final response = await sl<ApiConsumer>().post(
        EndPoint.forgetPassword,
        data: {
          ApiKeys.email: email,
        },
      );
      final data = ForgetpassModel.fromJson(response);
      return Right(data);
    } on ServerException catch (error) {
      return Left(error.errorModel.errorMessage);
    }
  }

  Future<Either<String, VerfiyResetcodeModel>> verifyCode(
      {required String email, required String code}) async {
    try {
      final response =
          await sl<ApiConsumer>().post(EndPoint.verifyResetEmail, data: {
        ApiKeys.email: email,
        ApiKeys.code: code,
      });
      final userr = VerfiyResetcodeModel.fromJson(response);
      return Right(userr);
    } on ServerException catch (error) {
      return Left(error.errorModel.errorMessage);
    }
  }

  Future<Either<String, ResetPassModel>> resetPass(
      {required String email,
      required String token,
      required String newPassword}) async {
    try {
      final response = await await sl<ApiConsumer>()
          .post(EndPoint.resetPassword, isFormData: false, data: {
        ApiKeys.email: email,
        ApiKeys.token: token,
        ApiKeys.newPassword: newPassword,
      });
      final reset = ResetPassModel.fromJson(response);
      return Right(reset);
    } on ServerException catch (error) {
      return Left(error.errorModel.errorMessage);
    }
  }
}
