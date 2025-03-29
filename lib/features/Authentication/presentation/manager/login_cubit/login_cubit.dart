import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grace_cycle/core/database/local/cache_helper.dart';
import 'package:grace_cycle/core/database/remote/end_points.dart';
import 'package:grace_cycle/core/firebase/login_methods/login_methods.dart';
import 'package:grace_cycle/core/service/service_locator.dart';

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

    result.fold((error) => emit(LoginFailure(error)), (login) async {
      await sl<CacheHelper>()
          .saveData(key: ApiKeys.authorization, value: login.token);

      emit(LoginSuccessful());
    });
    //user = LoginModel.fromJson(result as Map<String, dynamic>);
    //emit(LoginSuccessful());

    //final decodedToken =JwtDecoder.decode(user!.token);
    // await sl<CacheHelper>()
    //       .saveData(key: ApiKeys.token, value: user!.token);
    //  await sl<CacheHelper>()
    //       .saveData(key: ApiKeys.token, value: decodedToken[ApiKeys.id]);
  }

  //login with google
  // Future<void> loginWithGoogle() async {
  //   emit(LoginLoadingWithGoogle());
  //   final result = await LoginMethods.signInWithGoogle();
  //   result.fold((error) => emit(LoginFailureWithGoogle(error)),
  //       (login) => emit(LoginSuccessfulWithGoogle()));
  // }

  Future<void> loginWithGoogle() async {
    emit(LoginLoadingWithGoogle());

    try {
      final result = await LoginMethods.signInWithGoogle();

      if (result != null) {
        emit(LoginSuccessfulWithGoogle());
      } else {
        emit(LoginFailureWithGoogle("Google sign-in was canceled."));
      }
    } catch (e) {
      emit(LoginFailureWithGoogle(e.toString()));
    }
  }
}
