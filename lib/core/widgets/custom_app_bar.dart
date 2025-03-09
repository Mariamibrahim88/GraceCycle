import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    //this.padding = const EdgeInsets.only(top: 45.0, left: 2.0),
    required this.onPressed,
  });
  final void Function()? onPressed;
  // final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: IconButton(
        onPressed: onPressed,
        padding: const EdgeInsets.all(18),
        iconSize: 32,
        icon: const Icon(
          Icons.arrow_back_outlined,
        ),
        // return AppBar(
        //   clipBehavior: Clip.none,
        //   elevation: 0,
        //   backgroundColor: Colors.transparent,
        //   leading: IconButton(
        //       onPressed: onPressed,
        //       // padding: const EdgeInsets.all(0),
        //       iconSize: 32,
        //       icon: const Icon(
        //         Icons.arrow_back_outlined,
        //       )),
        // Padding(
        //   padding: padding,
        //   child: GestureDetector(
        //     child: const Icon(
        //       Icons.arrow_back_outlined,
        //       size: 32,
        //     ),
        //   ),
        // ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
