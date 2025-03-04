import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grace_cycle/core/service/service_locator.dart';
import 'package:grace_cycle/features/Authentication/data/repos/forget_pass_repo.dart';

part 'forget_pass_state.dart';

class ForgetPassCubit extends Cubit<ForgetPassState> {
  ForgetPassCubit(this.forgetPassRepo) : super(ForgetPassInitialState());
  TextEditingController emailController = TextEditingController();
  TextEditingController codeController = TextEditingController();
  
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final ForgetPassRepo forgetPassRepo;

  Future<void> forgetPassword() async {
    emit(ForgetPassLoadingState());
    final result = await forgetPassRepo.forgetPass(email: emailController.text);
    result.fold(
      (l) => emit(ForgetPassFailedState(message: l.message)),
      (r) => emit(ForgetPassSuccessState()),
    );
  }

  void verfiyCode() async {
    emit(ForgetPassLoadingState());
    final result = await sl<ForgetPassRepo>()
        .verifyCode(email: emailController.text, code: codeController.text);
    result.fold(
      (l) => emit(ForgetPassFailedState(message: l.message)),
      (r) => emit(ForgetPassSuccessState()),
    );
  }
}
