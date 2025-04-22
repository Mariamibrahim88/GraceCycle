import 'package:flutter/material.dart';
import 'package:grace_cycle/core/widgets/custom_safe_area.dart';
import 'package:grace_cycle/features/details/presentation/views/widgets/vendor_details_view_body.dart';

class VendorDetailsView extends StatelessWidget {
  const VendorDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomSafeArea(body: VendorDetailsViewBody());
  }
}
