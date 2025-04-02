import 'package:flutter/material.dart';

class CustomCancelIcon extends StatelessWidget {
  const CustomCancelIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/cancel.png',
      fit: BoxFit.fill,
      width: 15,
      height: 15,
    );
  }
}