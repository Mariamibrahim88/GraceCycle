import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grace_cycle/core/database/local/cache_helper.dart';
import 'package:grace_cycle/core/database/remote/end_points.dart';
import 'package:grace_cycle/core/routes/app_routes.dart';
import 'package:grace_cycle/core/service/service_locator.dart';
import 'package:grace_cycle/core/utils/app_assets.dart';
import 'package:grace_cycle/core/utils/app_navigate.dart';
import 'package:grace_cycle/core/widgets/check_token_expired.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 7),
    vsync: this,
  )..repeat();
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.elasticInOut,
  );

  @override
  void initState() {
    super.initState();

    navigateToOnBourding();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
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
        const SizedBox(
          height: 20,
        ),
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

  void navigateToOnBourding() {
    Future.delayed(const Duration(seconds: 6)).then((value) async {
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
    });
  }
}
