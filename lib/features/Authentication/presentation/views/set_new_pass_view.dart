import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grace_cycle/core/utils/app_colors.dart';
import 'package:grace_cycle/core/widgets/custom_app_bar.dart';
import 'package:grace_cycle/features/Authentication/presentation/manager/forget_pass_cubit/forget_pass_cubit.dart';
import 'package:grace_cycle/features/Authentication/presentation/views/widgets/set_new_pass_view_body.dart';

class SetNewPassView extends StatelessWidget {
  const SetNewPassView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: context.read<ForgetPassCubit>(),
      child: SafeArea(
        child: Scaffold(
          appBar: CustomAppBar(onPressed: () {
            Navigator.pop(context);
          }),
          backgroundColor: AppColors.basicWhite,
          body: const SetNewPassViewBody(),
        ),
      ),
    );
  }
}
