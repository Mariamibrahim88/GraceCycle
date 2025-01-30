import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grace_cycle/core/utils/app_colors.dart';
import 'package:grace_cycle/core/widgets/custom_app_bar.dart';
import 'package:grace_cycle/features/Authentication/presentation/manager/register_cubit/register_cubit.dart';
import 'package:grace_cycle/features/Authentication/presentation/views/widgets/signup_continue_body.dart';

class SignupContinueView extends StatelessWidget {
  const SignupContinueView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: CustomAppBar(
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      backgroundColor: AppColors.basicWhite,
      //  Use the same RegisterCubit instance
      body: BlocProvider.value(
        value: BlocProvider.of<RegisterCubit>(context),
        child: const SignupContinueBody(),
      ),
    ));
  }
}
