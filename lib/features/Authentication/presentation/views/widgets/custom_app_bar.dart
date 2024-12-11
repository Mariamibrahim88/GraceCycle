import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.onPressed,
  });
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      clipBehavior: Clip.none,
      elevation: 0,
      backgroundColor: Colors.transparent,
      leading: GestureDetector(
        onTap: onPressed,
        child: const Padding(
          padding: EdgeInsets.only(top: 45.0, left: 2.0),
          child: Icon(
            Icons.arrow_back_outlined,
            size: 32,
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
