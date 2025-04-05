import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grace_cycle/core/service/service_locator.dart';
import 'package:grace_cycle/core/widgets/custom_safe_area.dart';
import 'package:grace_cycle/features/discover/data/repos/discover_repo.dart';
import 'package:grace_cycle/features/discover/presentation/manager/discover_cubit/discover_cubit.dart';
import 'package:grace_cycle/features/discover/presentation/views/widgets/discover_view_body.dart';
import 'package:grace_cycle/features/home/data/repos/home_repo.dart';
import 'package:grace_cycle/features/home/presentation/manager/Home_cubit/home_cubit.dart';

class DiscoverView extends StatelessWidget {
  const DiscoverView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomSafeArea(
      body: MultiBlocProvider(providers: [
        BlocProvider<DiscoverCubit>(
          create: (context) => DiscoverCubit(
              sl()..getVendorDiscover(pageIndex: 1, pageSize: 10)),
        ),
        BlocProvider<HomeCubit>(create: (context) => HomeCubit(sl())),
      ], child: const DiscoverViewBody()),
    );
  }
}
