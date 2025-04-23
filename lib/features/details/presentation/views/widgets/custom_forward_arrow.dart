import 'package:flutter/material.dart';

class CustomForwardArrow extends StatelessWidget {
  const CustomForwardArrow({
    super.key, this.color,
  });
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return  Icon(
      Icons.arrow_forward_ios,
      size: 15,
      color: color?? Colors.black,
    );
  }
}
