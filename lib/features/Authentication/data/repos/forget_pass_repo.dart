class ForgetPassRepo {
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

  // Future<Either<Failure, verifyEmailModel>> verifyEmail(
  //     {required String email, required String code}) async {
  //       try{
  //         final response = await sl<ApiConsumer>()
  //         .post(EndPoint.verifyEmail, isFormData: false, data: {
  //           ApiKeys.email: email,
  //           ApiKeys.code: code,
  //         });
  //         final userr = verifyEmailModel.fromJson(response);
  //         return Right(userr);
  //       } catch (e) {
  //         if (e is DioException) {
  //           print('nooooooooooooooooo');
  //           return (Left(ServerFailure.fromDioException(e)));
  //         }
  //         return (left(ServerFailure(e.toString())));
  //       }
  //     }

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
