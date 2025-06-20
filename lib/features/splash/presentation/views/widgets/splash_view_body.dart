import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grace_cycle/core/database/local/cache_helper.dart';
import 'package:grace_cycle/core/database/remote/end_points.dart';
import 'package:grace_cycle/core/routes/app_routes.dart';
import 'package:grace_cycle/core/service/service_locator.dart';
import 'package:grace_cycle/core/utils/app_assets.dart';
import 'package:grace_cycle/core/utils/app_colors.dart';
import 'package:grace_cycle/core/utils/app_navigate.dart';
import 'package:grace_cycle/core/utils/app_text_styles.dart';
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

  bool hasNavigated = false;
  bool isDialogShown = false;

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
        InternetConnection().onStatusChange.listen((status) async {
      if (status == InternetStatus.disconnected) {
        _showNoInternetDialog();
      } else if (status == InternetStatus.connected) {
        _dismissNoInternetDialog();
        if (!hasNavigated) {
          navigateToOnBoarding();
        }
      }
    });
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
      _showNoInternetDialog();
    } else {
      navigateToOnBoarding();
    }
  }

  void _showNoInternetDialog() {
    if (isDialogShown) return;
    isDialogShown = true;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => AlertDialog(
        backgroundColor: AppColors.basicWhite,
        title: Text(
          'No Internet',
          style: AppTextStyles.nunito500Size17GreenButt,
        ),
        content: Text(
          'Please check your connection and try again.',
          style: AppTextStyles.nunito400Size16Black,
        ),
        actions: [
          TextButton(
            onPressed: () async {
              final isConnected = await InternetConnection().hasInternetAccess;
              if (isConnected) {
                _dismissNoInternetDialog();
                if (!hasNavigated) navigateToOnBoarding();
              }
              Navigator.of(context, rootNavigator: true).pop();
            },
            child: Text(
              'Retry',
              style: AppTextStyles.nunito500Size16GreenButt,
            ),
          ),
        ],
      ),
    );
  }

  void _dismissNoInternetDialog() {
    if (isDialogShown) {
      Navigator.of(context, rootNavigator: true).pop();
      isDialogShown = false;
    }
  }

  void navigateToOnBoarding() async {
    if (hasNavigated) return;
    hasNavigated = true;

    final isConnected = await InternetConnection().hasInternetAccess;
    if (!isConnected) return;

    await Future.delayed(const Duration(seconds: 6));
    if (!mounted) return;

    final token = await sl<CacheHelper>().getData(key: ApiKeys.authorization);
    final didFinishOnboarding =
        sl<CacheHelper>().getDataBool(key: ApiKeys.onBourding) == true;

    final route = (token == null || isTokenExpired(token))
        ? (didFinishOnboarding ? Routes.signup : Routes.onBourding)
        : Routes.navBar;

    navigate(context: context, route: route);
  }
}
