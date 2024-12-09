import 'package:flutter/material.dart';
import 'package:grace_cycle/features/Authentication/presentation/views/widgets/login_view_body.dart';

class LoginInView extends StatelessWidget {
  const LoginInView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: LoginViewBody(),
    ));
  }
}
