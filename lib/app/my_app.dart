import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grace_cycle/core/routes/app_routes.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isConnected = true;
  StreamSubscription? connectionSubscription;

  @override
  void initState() {
    super.initState();
    connectionSubscription =
        InternetConnection().onStatusChange.listen((status) {
      switch (status) {
        case InternetStatus.connected:
          setState(() {
            isConnected = true;
          });
          break;
        case InternetStatus.disconnected:
          setState(() {
            isConnected = false;
          });
          break;
      }
    });
  }

  @override
  void dispose() {
    connectionSubscription?.cancel();
    super.dispose();
  }

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
