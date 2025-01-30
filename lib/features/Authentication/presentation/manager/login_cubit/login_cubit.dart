import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:grace_cycle/features/Authentication/data/models/login_model.dart';
import 'package:grace_cycle/features/Authentication/data/repos/login_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.loginRepo) : super(LoginInitial());

   TextEditingController emailController = TextEditingController();
   TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final LoginRepo loginRepo;
  LoginModel? user;

  Future<void> login() async {
    emit(LoginLoading());

    final result = await loginRepo.logIn(
        email: emailController.text, password: passwordController.text);

    result.fold((error) => emit(LoginFailure(error)), (login)  => emit(LoginSuccessful()));
      //user = LoginModel.fromJson(result as Map<String, dynamic>);
      //emit(LoginSuccessful());

      //final decodedToken =JwtDecoder.decode(user!.token);
      // await sl<CacheHelper>()
      //       .saveData(key: ApiKeys.token, value: user!.token);
      //  await sl<CacheHelper>()
      //       .saveData(key: ApiKeys.token, value: decodedToken[ApiKeys.id]);
    
  }
}
