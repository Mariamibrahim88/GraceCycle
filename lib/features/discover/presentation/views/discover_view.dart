import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:grace_cycle/core/widgets/custom_safe_area.dart';
import 'package:grace_cycle/features/discover/presentation/views/widgets/discover_view_body.dart';

class DiscoverView extends StatelessWidget {
  const DiscoverView({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomSafeArea(body: DiscoverViewBody());
  }
}
