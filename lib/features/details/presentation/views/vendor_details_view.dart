import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grace_cycle/core/service/service_locator.dart';
import 'package:grace_cycle/core/widgets/custom_safe_area.dart';
import 'package:grace_cycle/features/details/presentation/views/widgets/vendor_details_view_body.dart';
import 'package:grace_cycle/features/home/presentation/manager/Home_cubit/home_cubit.dart';

class VendorDetailsView extends StatelessWidget {
  const VendorDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomSafeArea(
        body: BlocProvider(
      create: (context) => HomeCubit(sl()),
      child: const VendorDetailsViewBody(),
    ));
  }
}
