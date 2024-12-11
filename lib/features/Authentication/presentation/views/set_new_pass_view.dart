import 'package:flutter/material.dart';
import 'package:grace_cycle/features/Authentication/presentation/views/widgets/custom_app_bar.dart';
import 'package:grace_cycle/features/Authentication/presentation/views/widgets/set_new_pass_view_body.dart';

class SetNewPassView extends StatelessWidget {
  const SetNewPassView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(onPressed: () {
          Navigator.pop(context);
        }),
        backgroundColor: Colors.white,
        body: SetNewPassViewBody(),
      ),
    );
  }
}
