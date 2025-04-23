import 'package:flutter/material.dart';
import 'package:grace_cycle/core/utils/app_colors.dart';
import 'package:grace_cycle/core/utils/app_text_styles.dart';

class ListTileItemOfFilter extends StatelessWidget {
  const ListTileItemOfFilter({
    super.key,
    required this.title,
    required this.isSelected,
  });

  final String title;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: AppTextStyles.nunito500Size16Black,
      ),
      trailing: isSelected
          ? const Icon(
              Icons.check,
              color: AppColors.basicGreen,
            )
          : const Icon(
              Icons.circle_outlined,
              color: Colors.transparent,
            ),
    );
  }
}
