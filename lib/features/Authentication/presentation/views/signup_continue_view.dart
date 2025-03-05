import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grace_cycle/core/widgets/custom_safe_area.dart';
import 'package:grace_cycle/features/Authentication/presentation/manager/register_cubit/register_cubit.dart';
import 'package:grace_cycle/features/Authentication/presentation/views/widgets/signup_continue_body.dart';

class SignupContinueView extends StatelessWidget {
  const SignupContinueView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomSafeArea(
      body: BlocProvider.value(
        value: BlocProvider.of<RegisterCubit>(context),
        child: const SignupContinueBody(),
      ),
    );
  }
}
