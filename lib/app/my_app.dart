import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grace_cycle/core/routes/app_routes.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Grace Cycle',
      initialRoute: Routes.initialRoute,
      onGenerateRoute: AppRoutes.generateRoute,
      // theme: getAppThem()
    );
  }
}
