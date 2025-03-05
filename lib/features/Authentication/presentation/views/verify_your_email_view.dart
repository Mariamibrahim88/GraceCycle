import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grace_cycle/core/widgets/custom_safe_area.dart';
import 'package:grace_cycle/features/Authentication/presentation/manager/forget_pass_cubit/forget_pass_cubit.dart';
import 'package:grace_cycle/features/Authentication/presentation/views/widgets/verify_your_email_view_body.dart';

class VerifyYourEmailView extends StatelessWidget {
  const VerifyYourEmailView({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: context.read<ForgetPassCubit>(),
      child: const CustomSafeArea(
        body: VerifyYourEmailViewBody(),
      ),
    );
  }
}
