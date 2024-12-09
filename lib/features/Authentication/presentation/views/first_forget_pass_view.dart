import 'package:flutter/material.dart';
import 'package:grace_cycle/features/Authentication/presentation/views/widgets/first_forget_pass_view_body.dart';

class FirstForgetPassView extends StatelessWidget {
  const FirstForgetPassView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        clipBehavior: Clip.none,
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: const EdgeInsets.only(top: 45.0, left: 2.0),
          child: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_back_outlined,
              size: 32,
            ),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: FirstForgetPassViewBody(),
    );
  }
}
