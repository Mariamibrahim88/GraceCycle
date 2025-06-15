import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grace_cycle/core/database/local/cache_helper.dart';
import 'package:grace_cycle/core/database/remote/end_points.dart';
import 'package:grace_cycle/core/routes/app_routes.dart';
import 'package:grace_cycle/core/service/service_locator.dart';
import 'package:grace_cycle/core/utils/app_assets.dart';
import 'package:grace_cycle/core/utils/app_navigate.dart';
import 'package:grace_cycle/core/widgets/check_token_expired.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with TickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;
  StreamSubscription<InternetStatus>? _connectionSubscription;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 7),
      vsync: this,
    )..repeat();

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.elasticInOut,
    );

    _checkInitialConnection();

    _connectionSubscription =
        InternetConnection().onStatusChange.listen((status) {
      if (status == InternetStatus.disconnected) {
        navigate(
          context: context,
          route: Routes.noInternet,
        );
      } else if (status == InternetStatus.connected) {
        navigateToOnBoarding();
      }
    });

    navigateToOnBoarding();
  }

  @override
  void dispose() {
    _controller.dispose();
    _connectionSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RotationTransition(
          turns: _animation,
          alignment: Alignment.center,
          child: SvgPicture.asset(
            AppAssets.imgLogo,
            height: 90,
          ),
        ),
        const SizedBox(height: 20),
        ScaleTransition(
          scale: _animation,
          alignment: Alignment.topCenter,
          child: SvgPicture.asset(
            AppAssets.imgAppName,
            height: 25,
          ),
        ),
      ],
    );
  }

  void _checkInitialConnection() async {
    final isConnected = await InternetConnection().hasInternetAccess;
    if (!isConnected) {
      navigate(context: context, route: Routes.noInternet);
    } else {
      navigateToOnBoarding();
    }
  }

  void navigateToOnBoarding() async {
    final isConnected = await InternetConnection().hasInternetAccess;
    if (!isConnected) return;
    await Future.delayed(const Duration(seconds: 6));
    if (!mounted) return;

    final token = await sl<CacheHelper>().getData(key: ApiKeys.authorization);
    final didFinishOnboarding =
        sl<CacheHelper>().getDataBool(key: ApiKeys.onBourding) == true;

    if (token == null || isTokenExpired(token)) {
      navigate(
        context: context,
        route: didFinishOnboarding ? Routes.signup : Routes.onBourding,
      );
    } else {
      navigate(context: context, route: Routes.navBar);
    }
  }
}
