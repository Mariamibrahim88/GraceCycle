import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      clipBehavior: Clip.none,
      elevation: 0,
      backgroundColor: Colors.transparent,
      leading: Padding(
        padding: const EdgeInsets.only(top: 45.0, left: 2.0),
        child: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_outlined,
            size: 32,
          ),
        ),
      ),
    );
  }
}
