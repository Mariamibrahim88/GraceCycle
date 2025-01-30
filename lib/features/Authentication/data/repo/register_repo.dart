import 'package:dartz/dartz.dart';
import 'package:grace_cycle/core/database/remote/api_consumer.dart';
import 'package:grace_cycle/core/database/remote/end_points.dart';
import 'package:grace_cycle/core/errors/exceptions.dart';
import 'package:grace_cycle/core/service/service_locator.dart';
import 'package:grace_cycle/features/Authentication/data/models/register_model.dart';

class RegisterRepo {
  Future<Either<String, RegisterModel>> register({
    required String username,
    required String email,
    required String password,
    required String address,
    required List<String> conditions,
    required String phonenumber,
  }) async {
    try {
      final response = await sl<ApiConsumer>().post(
        EndPoint.signUp,
        data: {
          ApiKeys.username: username,
          ApiKeys.email: email,
          ApiKeys.password: password,
          ApiKeys.address: address,
          ApiKeys.conditions: conditions,
          ApiKeys.phonenumber: phonenumber,
        },
      );
      return Right(RegisterModel.fromJson(response));
    } on ServerException catch (error) {
      return Left(error.errorModel.errorMessage);
    }
  }
}
