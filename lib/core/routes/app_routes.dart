import 'package:flutter/material.dart';
import 'package:grace_cycle/features/Authentication/presentation/views/first_forget_pass_view.dart';
import 'package:grace_cycle/features/Authentication/presentation/views/login_in_view.dart';
import 'package:grace_cycle/features/Authentication/presentation/views/set_new_pass_view.dart';
import 'package:grace_cycle/features/Authentication/presentation/views/signup_continue_view.dart';
import 'package:grace_cycle/features/Authentication/presentation/views/signup_view.dart';
import 'package:grace_cycle/features/Authentication/presentation/views/succ_set_new_pass_view.dart';
import 'package:grace_cycle/features/Authentication/presentation/views/verify_your_email_view.dart';
import 'package:grace_cycle/features/home/presentation/views/home_view.dart';
import 'package:grace_cycle/features/onBourding/presentation/views/onbourding_view.dart';
import 'package:grace_cycle/features/splash/presentation/views/splash_view.dart';

class Routes {
  static const String initialRoute = '/';
  static const String signup = '/signup';
  static const String continueSignup = '/signupContinue';
  static const String login = '/login';
  static const String firstForgetPass = '/firstForgetPass';
  static const String verfiyYourEmail = '/verfiyYourEmail';
  static const String setNewPass = '/setNewPass';
  static const String succSetNewPass = '/succSetNewPass';
  static const String onBourding = '/OnBourding';
  static const String home = '/home';
  static const String navBar = '/navBar';
}

class AppRoutes {
  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.initialRoute:
        return MaterialPageRoute(builder: (_) => const VerifyYourEmailView());
      case Routes.home:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case Routes.onBourding:
        return MaterialPageRoute(builder: (_) => const OnBourdingView());
      case Routes.continueSignup:
        return MaterialPageRoute(builder: (_) => const SignupContinueView());
      case Routes.login:
        return MaterialPageRoute(builder: (_) => const LoginInView());
      case Routes.firstForgetPass:
        return MaterialPageRoute(builder: (_) => const FirstForgetPassView());
      case Routes.verfiyYourEmail:
        return MaterialPageRoute(builder: (_) => const VerifyYourEmailView());
      case Routes.setNewPass:
        return MaterialPageRoute(builder: (_) => const SetNewPassView());
      case Routes.succSetNewPass:
        return MaterialPageRoute(builder: (_) => const SuccSetNewPassView());
      case Routes.signup:
        return MaterialPageRoute(builder: (_) => const SignupView());
      case Routes.navBar:
        return MaterialPageRoute(builder: (_) => const HomeView());
      default:
        return MaterialPageRoute(builder: (_) => const Scaffold());
    }
  }
}
