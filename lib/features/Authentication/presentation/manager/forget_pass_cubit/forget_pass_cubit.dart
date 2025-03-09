import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grace_cycle/core/service/service_locator.dart';
import 'package:grace_cycle/features/Authentication/data/repos/forget_pass_repo.dart';

part 'forget_pass_state.dart';

class ForgetPassCubit extends Cubit<ForgetPassState> {
  ForgetPassCubit(this.forgetPassRepo) : super(ForgetPassInitialState()) {
    _initializeOtpControllers();
  }
  TextEditingController emailController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  final List<TextEditingController> otpControllers = [];
  String? verificationToken;
  // GlobalKey<FormState> formFirstKey = GlobalKey<FormState>();
  // GlobalKey<FormState> formSecondKey = GlobalKey<FormState>();

  final ForgetPassRepo forgetPassRepo;

  void _initializeOtpControllers() {
    otpControllers.clear();
    for (int i = 0; i < 4; i++) {
      otpControllers.add(TextEditingController());
    }
  }

  void setEmail(String email) {
    emailController.text = email;
  }

  String getOtpCode() {
    return otpControllers.map((controller) => controller.text).join();
  }

  Future<void> forgetPassword() async {
    emit(ForgetPassLoadingState());
    final result = await forgetPassRepo.forgetPass(email: emailController.text);
    result.fold(
      (l) => emit(ForgetPassFailedState(message: l)),
      (r) => emit(ForgetPassSuccessState()),
    );
  }

  void verfiyCode() async {
    emit(VerifyCodeLoadingState());
    final result = await sl<ForgetPassRepo>().verifyCode(
      email: emailController.text,
      code: getOtpCode(),
    );
    result.fold(
      (l) => emit(VerifyCodeFailedState(message: l)),
      (verify) {
        verificationToken = verify.token;
        emit(VerifyCodeSuccessState());
      },
    );
  }

  void resetPassword() async {
    emit(ResetPassLoadingState());
    final result = await sl<ForgetPassRepo>().resetPass(
        email: emailController.text,
        token: verificationToken ?? "",
        newPassword: newPasswordController.text);

    result.fold((l) => emit(ResetPassFailedState(message: l)),
        (r) => emit(ResetPassSuccessState()));
  }

  @override
  Future<void> close() {
    for (var controller in otpControllers) {
      controller.dispose();
    }
    return super.close();
  }
}
