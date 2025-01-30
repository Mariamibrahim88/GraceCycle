import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String message, Color color) {
  final snackBar = SnackBar(
    backgroundColor: color,
    padding: const EdgeInsets.all(30.0),
    content: Text(
      message,
      style: Theme.of(context).textTheme.displayMedium?.copyWith(
            color: Colors.white,
          ),
    ),
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.0),
    ),
    duration: const Duration(seconds: 3),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
