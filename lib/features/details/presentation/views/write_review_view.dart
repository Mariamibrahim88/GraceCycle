import 'package:flutter/material.dart';
import 'package:grace_cycle/core/widgets/custom_safe_area.dart';
import 'package:grace_cycle/features/details/presentation/views/widgets/write_review_view_body.dart';

class WriteReviewView extends StatelessWidget {
  const WriteReviewView({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomSafeArea(
      body: WriteReviewViewBody(),
    );
  }
}
