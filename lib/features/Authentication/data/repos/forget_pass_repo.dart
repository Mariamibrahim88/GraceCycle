import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:grace_cycle/core/database/remote/api_consumer.dart';
import 'package:grace_cycle/core/database/remote/end_points.dart';
import 'package:grace_cycle/core/errors/failure.dart';
import 'package:grace_cycle/core/service/service_locator.dart';
import 'package:grace_cycle/features/Authentication/data/models/forgetpass_model.dart';
import 'package:grace_cycle/features/Authentication/data/models/verfiyresetcode_model.dart';

class ForgetPassRepo {
  Future<Either<Failure, ForgetpassModel>> forgetPass(
      {required String email}) async {
    try {
      final response = await sl<ApiConsumer>().post(
        'https://food-api-omega.vercel.app/api/v1/chef/send-code',
        data: {
          ApiKeys.email: email,
        },
      );
      final data = ForgetpassModel.fromJson(response);
      return Right(data);
    } catch (e) {
      if (e is DioException) {
        print(
            '******************************************************************');
        return (Left(ServerFailure.fromDioException(e)));
      }
      return (left(ServerFailure(e.toString())));
    }
  }

  Future<Either<Failure, VerfiyResetcodeModel>> verifyCode(
      {required String email, required String code}) async {
    try {
      final response =
          await sl<ApiConsumer>().post(EndPoint.verifyResetEmail, data: {
        ApiKeys.email: email,
        ApiKeys.code: code,
      });
      final userr = VerfiyResetcodeModel.fromJson(response);
      return Right(userr);
    } catch (e) {
      if (e is DioException) {
        print(
            '***************************************************************');
        return (Left(ServerFailure.fromDioException(e)));
      }
      return (left(ServerFailure(e.toString())));
    }
  }

  //  Future<Either<Failure, SendCodeModel>> sendCode(
  //     {required String email}) async {
  //   try {
  //     final response =
  //         await sl<ApiConsumer>().post(EndPoint.sendCode, isFormData: false, data: {
  //       ApiKeys.email: email,
  //     });
  //     final userr = SendCodeModel.fromJson(response);
  //     return Right(userr);
  //   } catch (e) {
  //     if (e is DioException) {
  //       print('nooooooooooooooooo');
  //       return (Left(ServerFailure.fromDioException(e)));
  //     }
  //     return (left(ServerFailure(e.toString())));
  //   }
  // }

  // Future <Either<String,resetPassModel>> resetPass({required String email,required String token,required String newPassword})async{
  //   try{
  //     // final response = await await sl<ApiConsumer>().post(EndPoint.resetPassword, isFormData: false, data: {
  //     //   ApiKeys.email: email,
  //     //   ApiKeys.token: token,
  //     //   ApiKeys.newPassword: newPassword,
  //     // });
  //     // final userr = resetPassModel.fromJson(response);
  //     // return Right(userr);
  //   } catch (e) {
  //     // if (e is DioException) {
  //     //   print('nooooooooooooooooo');
  //     //   return (Left(ServerFailure.fromDioException(e)));
  //     // }
  //     return (Left(e.toString()));
  //   }
  // }
}
