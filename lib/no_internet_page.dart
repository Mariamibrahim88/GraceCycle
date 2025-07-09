import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grace_cycle/core/utils/app_assets.dart';
import 'package:grace_cycle/core/utils/app_colors.dart';
import 'package:grace_cycle/core/utils/app_spacing.dart';
// import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

class NoInternetPage extends StatelessWidget {
  const NoInternetPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.basicWhite,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                AppAssets.noInternet,
                height: 200,
              ),
              verticalSpace(24),
              const Text(
                'No Internet Connection',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              verticalSpace(12),
              const Text(
                'Please check your network settings and try again.',
                textAlign: TextAlign.center,
              ),
              verticalSpace(24),
              ElevatedButton(
                onPressed: () async {
                  // Check internet connection
                  // final isConnected =
                  //     await InternetConnection().hasInternetAccess;
                  // if (isConnected) {
                  if (context.mounted) Navigator.of(context).pop();
                  // } else {
                  //   if (context.mounted) {
                  //     ScaffoldMessenger.of(context).showSnackBar(
                  //       const SnackBar(
                  //           content: Text('Still no internet connection.')),
                  //     );
                  //   }
                  // }
                },
                child: const Text('Retry'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
