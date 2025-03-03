import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:grace_cycle/core/database/remote/api_consumer.dart';
import 'package:grace_cycle/core/database/remote/end_points.dart';
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
}
