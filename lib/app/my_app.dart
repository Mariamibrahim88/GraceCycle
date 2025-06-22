import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grace_cycle/core/routes/app_routes.dart';
import 'package:grace_cycle/core/service/service_locator.dart';
import 'package:grace_cycle/features/cart/presentation/manager/cubit/cart_cubit.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return BlocProvider(
      create: (context) => CartCubit(sl()),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Grace Cycle',
        initialRoute: Routes.initialRoute,
        onGenerateRoute: AppRoutes.generateRoute,
        // theme: getAppThem()
      ),
    );
  }
}
