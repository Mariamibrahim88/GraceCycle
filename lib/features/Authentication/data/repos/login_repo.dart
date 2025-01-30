import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:grace_cycle/core/database/remote/api_consumer.dart';
import 'package:grace_cycle/core/database/remote/end_points.dart';
import 'package:grace_cycle/core/errors/exceptions.dart';
import 'package:grace_cycle/core/service/service_locator.dart';
import 'package:grace_cycle/features/Authentication/data/models/login_model.dart';

class LoginRepo {
  // final ApiService apiService;

  // LoginRepo(this.apiService);

  Future<Either<String, LoginModel>> logIn(
      {required String email, required String password}) async {
    try {
      final response = await sl<ApiConsumer>().post(EndPoint.signIn, data: {
        ApiKeys.email: email,
        ApiKeys.password: password,
      });
      // final response = await apiService.post(EndPoint.signIn, isFormData: false, data: {
      //   ApiKeys.email: email,
      //   ApiKeys.password: password,
      // });

      return Right(LoginModel.fromJson(response));
    } catch (e) {
      if (e is DioException) {
        return Left(e.error.toString());
      }
      return Left(e.toString());
    }
  }

  // @override
  // Future<Either<Failure, SendCodeModel>> sendCode(
  //     {required String email}) async {
  //   try {
  //     final response =
  //         await apiService.post(EndPoint.sendCode, isFormData: false, data: {
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

  // @override
  // Future<Either<Failure, resetPassModel>> resetPassword(
  //     {required String email,
  //     required String code,
  //     required String confirmPassword,
  //     required String password}) async {
  //   try {
  //     final response = await apiService.patch(EndPoint.resetPassword, {
  //       ApiKeys.email: email,
  //       ApiKeys.code: code,
  //       ApiKeys.confirmPassword: confirmPassword,
  //       ApiKeys.password: password,
  //     });
  //     final userr = resetPassModel.fromJson(response);
  //     return Right(userr);
  //   } catch (e) {
  //     if (e is DioException) {
  //       print('nooooooooooooooooo');
  //       return (Left(ServerFailure.fromDioException(e)));
  //     }
  //     return (left(ServerFailure(e.toString())));
  //   }
  // }
}
