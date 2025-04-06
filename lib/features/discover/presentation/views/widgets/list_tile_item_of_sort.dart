import 'package:flutter/material.dart';
import 'package:grace_cycle/core/utils/app_text_styles.dart';

class ListTileItemOfSort extends StatelessWidget {
  const ListTileItemOfSort({super.key, required this.title, this.onTap});

  final String title;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ListTile(
        title: Text(
          title,
          style: AppTextStyles.nunito500Size16GreenButt,
        ),
      ),
    );
  }
}
