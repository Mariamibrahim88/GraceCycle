import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grace_cycle/app/my_app.dart';
import 'package:grace_cycle/core/database/local/cache_helper.dart';
import 'package:grace_cycle/core/service/service_locator.dart';
import 'package:grace_cycle/firebase_options.dart';

void main() async {
  initServiceLocator();
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await sl<CacheHelper>().init();
  //await sl<CacheHelper>().clearData();
  // Stripe.publishableKey =
  //     'pk_live_51QExfyLLV2zZUYwqQbeEde0aK6YGKTx1o9TcQMHTe2HdIQwfo2C0C4TzgpsgTaafXtt3FaXH8onFs8EHkYcugCBH00v04buUJT'; // You’ll give them this from Stripe dashboard
  // await Stripe.instance.applySettings();
  runApp(const MyApp());
}
