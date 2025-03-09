import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grace_cycle/core/service/service_locator.dart';
import 'package:grace_cycle/core/widgets/custom_safe_area.dart';
import 'package:grace_cycle/features/Authentication/presentation/manager/forget_pass_cubit/forget_pass_cubit.dart';
import 'package:grace_cycle/features/Authentication/presentation/views/widgets/first_forget_pass_view_body.dart';

class FirstForgetPassView extends StatelessWidget {
  const FirstForgetPassView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ForgetPassCubit(sl()),
      child: const CustomSafeArea(
        body: FirstForgetPassViewBody(),
      ),
    );
  }
}
