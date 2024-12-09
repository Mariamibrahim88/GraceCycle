import 'package:flutter/material.dart';
import 'package:grace_cycle/features/Authentication/presentation/views/widgets/signup_view_body.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SignupViewBody(),
      ),
    );
  }
}
