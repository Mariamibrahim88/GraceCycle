import 'package:flutter/material.dart';
import 'package:grace_cycle/features/Authentication/presentation/views/signup_view.dart';

class Routes {
  static const String initialRoute = '/';

  ///static const String login = '/signup';
  // static const String changLan = '/changLan';
}

class AppRoutes {
  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.initialRoute:
        return MaterialPageRoute(builder: (_) => const SignupView());
      // case Routes.login:
      //   return MaterialPageRoute(builder: (_) => const LoginView());
      // case Routes.changLan:
      //   return MaterialPageRoute(builder: (_) => const ChangeLangScreen());
      default:
        return MaterialPageRoute(builder: (_) => const Scaffold());
    }
  }
}
