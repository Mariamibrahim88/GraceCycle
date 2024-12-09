import 'package:flutter/material.dart';
import 'package:grace_cycle/features/Authentication/presentation/views/widgets/signup_continue_body.dart';

class SignupContinueView extends StatelessWidget {
  const SignupContinueView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: SignupContinueBody(),
    ));
  }
}
