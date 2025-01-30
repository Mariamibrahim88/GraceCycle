import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grace_cycle/app/my_app.dart';
import 'package:grace_cycle/core/service/service_locator.dart';

void main() async {
  initServiceLocator();
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  //CacheHelper().init();
  runApp(const MyApp());
}
