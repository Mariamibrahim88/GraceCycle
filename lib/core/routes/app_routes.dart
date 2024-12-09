import 'package:flutter/material.dart';
import 'package:grace_cycle/features/Authentication/presentation/views/login_in_view.dart';
import 'package:grace_cycle/features/Authentication/presentation/views/signup_continue_view.dart';
import 'package:grace_cycle/features/Authentication/presentation/views/signup_view.dart';

class Routes {
  static const String initialRoute = '/';

  static const String continueSignup = '/signupContinue';
  static const String login = '/login';
}

class AppRoutes {
  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.initialRoute:
        return MaterialPageRoute(builder: (_) => const SignupView());
      case Routes.continueSignup:
        return MaterialPageRoute(builder: (_) => const SignupContinueView());
      case Routes.login:
        return MaterialPageRoute(builder: (_) => const LoginInView());
      default:
        return MaterialPageRoute(builder: (_) => const Scaffold());
    }
  }
}
