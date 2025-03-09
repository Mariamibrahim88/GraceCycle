import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grace_cycle/core/widgets/custom_safe_area.dart';
import 'package:grace_cycle/features/Authentication/presentation/manager/forget_pass_cubit/forget_pass_cubit.dart';
import 'package:grace_cycle/features/Authentication/presentation/views/widgets/set_new_pass_view_body.dart';

class SetNewPassView extends StatelessWidget {
  const SetNewPassView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: context.read<ForgetPassCubit>(),
      child: const CustomSafeArea(
        body: SetNewPassViewBody(),
      ),
    );
  }
}
