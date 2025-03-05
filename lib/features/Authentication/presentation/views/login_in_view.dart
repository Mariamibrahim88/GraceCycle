import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grace_cycle/core/service/service_locator.dart';
import 'package:grace_cycle/core/widgets/custom_safe_area.dart';
import 'package:grace_cycle/features/Authentication/presentation/manager/login_cubit/login_cubit.dart';
import 'package:grace_cycle/features/Authentication/presentation/views/widgets/login_view_body.dart';

class LoginInView extends StatelessWidget {
  const LoginInView({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return CustomSafeArea(
        body: BlocProvider(
      create: (context) => LoginCubit(sl()),
      child: const LoginViewBody(),
    ));
  }
}
